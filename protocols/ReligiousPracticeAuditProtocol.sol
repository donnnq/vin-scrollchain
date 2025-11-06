// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReligiousPracticeAuditProtocol {
    address public steward;

    struct AuditEntry {
        string organization;
        string practiceType;
        string conflictArea;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event PracticeAuditTagged(string organization, string practiceType, string conflictArea, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPracticeAudit(
        string memory organization,
        string memory practiceType,
        string memory conflictArea,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(organization, practiceType, conflictArea, emotionalTag));
        emit PracticeAuditTagged(organization, practiceType, conflictArea, emotionalTag);
    }
}
