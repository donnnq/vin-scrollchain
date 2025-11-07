// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoCivilWarContainmentManifest {
    address public steward;

    struct ContainmentEntry {
        string conflictName;
        string timestamp;
        string ideologicalDivide;
        string reconciliationProposal;
        string emotionalTag;
    }

    ContainmentEntry[] public manifest;

    event CivilWarContained(string conflictName, string timestamp, string ideologicalDivide, string reconciliationProposal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containConflict(
        string memory conflictName,
        string memory timestamp,
        string memory ideologicalDivide,
        string memory reconciliationProposal,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ContainmentEntry(conflictName, timestamp, ideologicalDivide, reconciliationProposal, emotionalTag));
        emit CivilWarContained(conflictName, timestamp, ideologicalDivide, reconciliationProposal, emotionalTag);
    }
}
