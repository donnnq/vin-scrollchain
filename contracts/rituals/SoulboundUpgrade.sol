// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SoulboundUpgrade - Restores dignity and resilience to struggling citizens
/// @author Vinvin
/// @notice Only the scrollsmith can upgrade soulbound tokens based on civic need

contract SoulboundUpgrade {
    address public scrollsmith;

    struct Upgrade {
        string nation;
        address citizen;
        string traitUpgraded;
        string blessing;
        uint256 timestamp;
    }

    Upgrade[] public upgrades;
    mapping(address => bool) public isEligible;

    event UpgradeGranted(address indexed citizen, string traitUpgraded, string blessing, string nation);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Mark a citizen as eligible for soulbound upgrade
    function markEligible(address citizen) external onlyScrollsmith {
        isEligible[citizen] = true;
    }

    /// @notice Grant a soulbound upgrade to a citizen
    function grantUpgrade(address citizen, string calldata traitUpgraded, string calldata blessing, string calldata nation) external onlyScrollsmith {
        require(isEligible[citizen], "Citizen not eligible");

        upgrades.push(Upgrade({
            nation: nation,
            citizen: citizen,
            traitUpgraded: traitUpgraded,
            blessing: blessing,
            timestamp: block.timestamp
        }));

        emit UpgradeGranted(citizen, traitUpgraded, blessing, nation);
    }

    /// @notice View all upgrades
    function getAllUpgrades() external view returns (Upgrade[] memory) {
        return upgrades;
    }

    /// @notice Check if a citizen is eligible
    function checkEligibility(address citizen) external view returns (bool) {
        return isEligible[citizen];
    }
}
