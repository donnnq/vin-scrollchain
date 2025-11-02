// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DemocracyImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string officialName;
        string corridor;
        string immunityType;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event ImmunityGranted(string officialName, string corridor, string immunityType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function grantImmunity(
        string memory officialName,
        string memory corridor,
        string memory immunityType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(officialName, corridor, immunityType, emotionalTag));
        emit ImmunityGranted(officialName, corridor, immunityType, emotionalTag);
    }
}
