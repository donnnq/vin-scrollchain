// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Trade Tariff Enforcer for India
/// @notice If India sources any volume from Russia, their preferential tariff discount is revoked
///         and a punitive tariff (“Trump Slap”) is automatically applied.
contract vinTariffEnforcerIndia {
    /// @dev Role who governs trade policy (e.g. G20 Council, WTO delegate)
    address public policyCouncil;
    /// @dev Oracle feeding India→Russia purchase volumes in barrels or tonnes
    IRussiaPurchaseOracle public purchaseOracle;

    /// @notice Preferential discount rate (in percent)
    uint256 public constant DISCOUNT_RATE  = 5;
    /// @notice Punitive “Trump Slap” tariff rate (in percent)
    uint256 public constant SLAP_RATE      = 25;

    /// @notice Last reported volume from India→Russia
    uint256 public  lastReportedVolume;
    /// @notice Whether preferential discount is currently enabled
    bool    public  discountEnabled;

    /// @dev Emitted when discount eligibility toggles
    event DiscountStatusUpdated(bool enabled, uint256 timestamp);
    /// @dev Emitted when punitive tariff is slapped
    event TariffSlapped(uint256 appliedRate, uint256 timestamp);

    modifier onlyCouncil() {
        require(msg.sender == policyCouncil, "Not authorized");
        _;
    }

    constructor(address _council, address _oracle) {
        policyCouncil   = _council;
        purchaseOracle  = IRussiaPurchaseOracle(_oracle);
        discountEnabled = true;    // start with discount assumed
    }

    /// @notice Syncs with the oracle and reevaluates discount or slap tariff
    function refreshPolicy() external onlyCouncil {
        uint256 volume = purchaseOracle.latestVolume();
        lastReportedVolume = volume;

        if (volume == 0) {
            // India has fully cut Russian imports
            if (!discountEnabled) {
                discountEnabled = true;
                emit DiscountStatusUpdated(true, block.timestamp);
            }
        } else {
            // Any continued purchase revokes discount & triggers punitive tariff
            if (discountEnabled) {
                discountEnabled = false;
                emit DiscountStatusUpdated(false, block.timestamp);
            }
            emit TariffSlapped(SLAP_RATE, block.timestamp);
        }
    }

    /// @notice Returns the current tariff rate for India
    /// @return tariffPercent  Either standard rate minus discount, or punitive rate
    function currentTariffRate(uint256 standardRate) external view returns (uint256 tariffPercent) {
        if (discountEnabled) {
            // Apply discount
            uint256 reduction = (standardRate * DISCOUNT_RATE) / 100;
            return standardRate - reduction;
        } else {
            // Enforce punitive rate
            return SLAP_RATE;
        }
    }
}

/// @notice Minimal interface for on-chain import volume data
interface IRussiaPurchaseOracle {
    /// @return volume  Latest volume of India→Russia imports (barrels/tonnes)
    function latestVolume() external view returns (uint256);
}
