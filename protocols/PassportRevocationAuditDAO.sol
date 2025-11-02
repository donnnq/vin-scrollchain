// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PassportRevocationAuditDAO {
    address public steward;

    struct RevocationEntry {
        string subjectName;
        string civicThreatLevel;
        string revocationRequestSource;
        string emotionalTag;
    }

    RevocationEntry[] public registry;

    event PassportRevocationTagged(string subjectName, string civicThreatLevel, string revocationRequestSource, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRevocationRequest(
        string memory subjectName,
        string memory civicThreatLevel,
        string memory revocationRequestSource,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RevocationEntry(subjectName, civicThreatLevel, revocationRequestSource, emotionalTag));
        emit PassportRevocationTagged(subjectName, civicThreatLevel, revocationRequestSource, emotionalTag);
    }
}
