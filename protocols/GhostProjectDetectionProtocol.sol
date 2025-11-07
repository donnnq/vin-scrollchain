// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectDetectionProtocol {
    address public steward;

    struct ProjectCheck {
        string projectName;
        string barangay;
        string timestamp;
        string physicalStatus;
        string paymentStatus;
        string emotionalTag;
    }

    ProjectCheck[] public registry;

    event GhostProjectFlagged(string projectName, string barangay, string timestamp, string physicalStatus, string paymentStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function flagGhostProject(
        string memory projectName,
        string memory barangay,
        string memory timestamp,
        string memory physicalStatus,
        string memory paymentStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ProjectCheck(projectName, barangay, timestamp, physicalStatus, paymentStatus, emotionalTag));
        emit GhostProjectFlagged(projectName, barangay, timestamp, physicalStatus, paymentStatus, emotionalTag);
    }
}
