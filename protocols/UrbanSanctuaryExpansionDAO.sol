// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanSanctuaryExpansionDAO {
    address public steward;

    struct SanctuaryEntry {
        string city;
        string sanctuaryType;
        string expansionPartner;
        string emotionalTag;
    }

    SanctuaryEntry[] public registry;

    event SanctuaryExpanded(string city, string sanctuaryType, string expansionPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function expandSanctuary(
        string memory city,
        string memory sanctuaryType,
        string memory expansionPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SanctuaryEntry(city, sanctuaryType, expansionPartner, emotionalTag));
        emit SanctuaryExpanded(city, sanctuaryType, expansionPartner, emotionalTag);
    }
}
