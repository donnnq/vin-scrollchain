// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanSanctuaryDAO {
    address public steward;

    struct SanctuaryEntry {
        string location;
        string sanctuaryType;
        string communityPartner;
        string emotionalTag;
    }

    SanctuaryEntry[] public registry;

    event SanctuaryTagged(string location, string sanctuaryType, string communityPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagSanctuary(
        string memory location,
        string memory sanctuaryType,
        string memory communityPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SanctuaryEntry(location, sanctuaryType, communityPartner, emotionalTag));
        emit SanctuaryTagged(location, sanctuaryType, communityPartner, emotionalTag);
    }
}
