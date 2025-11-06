// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InducedDemandAuditProtocol {
    address public steward;

    struct AuditEntry {
        string projectName;
        string expansionType;
        string trafficOutcome;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event InducedDemandTagged(string projectName, string expansionType, string trafficOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAudit(
        string memory projectName,
        string memory expansionType,
        string memory trafficOutcome,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(projectName, expansionType, trafficOutcome, emotionalTag));
        emit InducedDemandTagged(projectName, expansionType, trafficOutcome, emotionalTag);
    }
}
