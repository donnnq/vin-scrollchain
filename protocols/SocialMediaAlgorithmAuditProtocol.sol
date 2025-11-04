// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SocialMediaAlgorithmAuditProtocol {
    address public steward;

    struct AuditEntry {
        string platform;
        string algorithmSignal;
        string auditMechanism;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event AlgorithmAudited(string platform, string algorithmSignal, string auditMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditAlgorithm(
        string memory platform,
        string memory algorithmSignal,
        string memory auditMechanism,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(platform, algorithmSignal, auditMechanism, emotionalTag));
        emit AlgorithmAudited(platform, algorithmSignal, auditMechanism, emotionalTag);
    }
}
