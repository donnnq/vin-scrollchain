// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectAuditProtocol {
    address public steward;

    struct AuditEntry {
        string projectName;
        string location;
        string anomalySignal;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event GhostProjectAudited(string projectName, string location, string anomalySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditGhostProject(
        string memory projectName,
        string memory location,
        string memory anomalySignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(projectName, location, anomalySignal, emotionalTag));
        emit GhostProjectAudited(projectName, location, anomalySignal, emotionalTag);
    }
}
