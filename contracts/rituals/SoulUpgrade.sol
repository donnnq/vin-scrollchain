// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SoulUpgrade - Ritual scroll for boosting soul metrics in low-score barangays using style and service upgrades
/// @author Vinvin
/// @notice Automatically triggers upgrades when soul scores fall below thresholds

contract SoulUpgrade {
    address public scrollsmith;

    struct UpgradeTrigger {
        uint256 joyThreshold;
        uint256 dignityThreshold;
        uint256 impactThreshold;
        bool upgradeScheduled;
        string upgradeType;
    }

    mapping(string => UpgradeTrigger) public barangayTriggers;

    event UpgradeScheduled(string indexed barangay, string upgradeType);
    event ThresholdSet(string indexed barangay, uint256 joy, uint256 dignity, uint256 impact);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Set soul thresholds for triggering upgrades
    function setThresholds(string memory barangay, uint256 joy, uint256 dignity, uint256 impact) external onlyScrollsmith {
        barangayTriggers[barangay] = UpgradeTrigger({
            joyThreshold: joy,
            dignityThreshold: dignity,
            impactThreshold: impact,
            upgradeScheduled: false,
            upgradeType: ""
        });
        emit ThresholdSet(barangay, joy, dignity, impact);
    }

    /// @notice Evaluate audit and schedule upgrade if needed
    function evaluateAudit(
        string memory barangay,
        uint256 joy,
        uint256 dignity,
        uint256 impact
    ) external onlyScrollsmith {
        UpgradeTrigger storage trigger = barangayTriggers[barangay];

        if (
            joy < trigger.joyThreshold ||
            dignity < trigger.dignityThreshold ||
            impact < trigger.impactThreshold
        ) {
            trigger.upgradeScheduled = true;
            trigger.upgradeType = "Style + Service Boost";
            emit UpgradeScheduled(barangay, trigger.upgradeType);
        }
    }

    /// @notice Check if upgrade is scheduled
    function isUpgradeScheduled(string memory barangay) external view returns (bool) {
        return barangayTriggers[barangay].upgradeScheduled;
    }
}
