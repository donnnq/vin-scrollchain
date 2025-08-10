// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TariffOracle - AI-synced tariff data feed for TradeOptimizer
contract TariffOracle {
    address public oracleKeeper;
    mapping(string => uint256) public liveTariffs; // HS code → current tariff %

    event TariffSynced(string indexed hsCode, uint256 newRate);
    event OracleKeeperChanged(address indexed newKeeper);

    modifier onlyKeeper() {
        require(msg.sender == oracleKeeper, "Not authorized.");
        _;
    }

    constructor() {
        oracleKeeper = msg.sender;
    }

    /// @notice Sync tariff rate from AI or external API
    function syncTariff(string memory hsCode, uint256 newRate) external onlyKeeper {
        liveTariffs[hsCode] = newRate;
        emit TariffSynced(hsCode, newRate);
    }

    /// @notice Get current tariff for a product
    function getTariff(string memory hsCode) external view returns (uint256) {
        return liveTariffs[hsCode];
    }

    /// @notice Transfer oracle keeper role
    function transferKeeper(address newKeeper) external onlyKeeper {
        oracleKeeper = newKeeper;
        emit OracleKeeperChanged(newKeeper);
    }
}
