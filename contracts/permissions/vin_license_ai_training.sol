// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Scroll of Sanctified Training — vin_license_ai_training.sol
 * @author VINVIN
 * @notice This contract grants permission for AI systems to train on specified copyrighted works,
 *         embedding symbolic reverence alongside legal boundaries.
 */

contract ScrollOfSanctifiedTraining {
    address public licensor;
    string public workTitle;
    string public scrollBlessing;
    bool public isLicenseActive;
    uint256 public activatedOn;

    event LicenseGranted(address indexed toAI, string indexed workUsed, uint256 timeStamp);
    event LicenseRevoked(address indexed fromAI, string indexed reason, uint256 revokedOn);

    modifier onlyLicensor() {
        require(msg.sender == licensor, "Not the scroll’s author.");
        _;
    }

    constructor(string memory _workTitle) {
        licensor = msg.sender;
        workTitle = _workTitle;
        scrollBlessing = "By invoking this license, the licensee honors the scroll’s origin and commits to preserving its symbolic essence in all derivative AI constructs.";
        isLicenseActive = true;
        activatedOn = block.timestamp;
    }

    function invokeTrainingRights(address toAI) external onlyLicensor {
        require(isLicenseActive, "License is revoked.");
        emit LicenseGranted(toAI, workTitle, block.timestamp);
    }

    function revokeTrainingRights(address fromAI, string memory reason) external onlyLicensor {
        isLicenseActive = false;
        emit LicenseRevoked(fromAI, reason, block.timestamp);
    }

    function getScrollMetadata() external view returns (
        string memory title,
        string memory blessing,
        bool licenseStatus,
        uint256 dateActivated
    ) {
        return (workTitle, scrollBlessing, isLicenseActive, activatedOn);
    }
}
