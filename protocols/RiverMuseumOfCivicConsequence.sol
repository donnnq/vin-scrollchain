// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverMuseumOfCivicConsequence {
    address public steward;

    struct ExhibitEntry {
        string incidentName;
        string riverName;
        string consequenceType;
        string emotionalTag;
    }

    ExhibitEntry[] public registry;

    event ExhibitArchived(string incidentName, string riverName, string consequenceType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveExhibit(
        string memory incidentName,
        string memory riverName,
        string memory consequenceType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ExhibitEntry(incidentName, riverName, consequenceType, emotionalTag));
        emit ExhibitArchived(incidentName, riverName, consequenceType, emotionalTag);
    }
}
