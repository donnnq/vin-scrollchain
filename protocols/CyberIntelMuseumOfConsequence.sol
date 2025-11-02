// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberIntelMuseumOfConsequence {
    address public steward;

    struct ExhibitEntry {
        string incidentName;
        string corridor;
        string consequenceType;
        string emotionalTag;
    }

    ExhibitEntry[] public registry;

    event ExhibitArchived(string incidentName, string corridor, string consequenceType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveExhibit(
        string memory incidentName,
        string memory corridor,
        string memory consequenceType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ExhibitEntry(incidentName, corridor, consequenceType, emotionalTag));
        emit ExhibitArchived(incidentName, corridor, consequenceType, emotionalTag);
    }
}
