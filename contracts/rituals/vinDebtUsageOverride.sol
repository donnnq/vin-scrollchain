// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinDebtUsageOverride - Ritual contract to override debt limits for civic restoration and dignity elevation
/// @author Vinvin
/// @notice Enables debt redirection toward wages, rent relief, and elder support
/// @dev Designed for mythic governance and economic mercy rituals

contract vinDebtUsageOverride {
    address public scrollsmith;
    uint256 public totalOverrideAmount;

    enum UsageType { WageElevation, RentReduction, ElderSupport, CivicBlessing }

    struct OverrideEvent {
        UsageType usage;
        uint256 amountUSD;
        string beneficiaryGroup;
        uint256 timestamp;
    }

    OverrideEvent[] public overrides;

    event OverrideExecuted(UsageType usage, string group, uint256 amount);
    event BlessingEmitted(string group, UsageType usage, uint256 timestamp);

    constructor() {
        scrollsmith = msg.sender;
    }

    function executeOverride(UsageType usage, uint256 amountUSD, string memory beneficiaryGroup) public {
        totalOverrideAmount += amountUSD;
        overrides.push(OverrideEvent(usage, amountUSD, beneficiaryGroup, block.timestamp));

        emit OverrideExecuted(usage, beneficiaryGroup, amountUSD);
        emit BlessingEmitted(beneficiaryGroup, usage, block.timestamp);
    }

    function getOverride(uint256 index) public view returns (OverrideEvent memory) {
        require(index < overrides.length, "Invalid index");
        return overrides[index];
    }

    function totalOverrides() public view returns (uint256) {
        return overrides.length;
    }
}
