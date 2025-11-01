// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditTheaterMuseumRegistry {
    address public steward;

    struct ExhibitEntry {
        string exhibitID;
        string corridor;
        string auditSubject;
        string emotionalTag;
    }

    ExhibitEntry[] public registry;

    event ExhibitTagged(string exhibitID, string corridor, string auditSubject, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagExhibit(
        string memory exhibitID,
        string memory corridor,
        string memory auditSubject,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ExhibitEntry(exhibitID, corridor, auditSubject, emotionalTag));
        emit ExhibitTagged(exhibitID, corridor, auditSubject, emotionalTag);
    }
}
