// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatireImmunityDAO {
    address public steward;

    struct SatireEntry {
        string memeTitle;
        string creator;
        string archetype;
        string immunityTag;
    }

    SatireEntry[] public registry;

    event SatireTagged(string memeTitle, string creator, string archetype);
    event ImmunityGranted(string memeTitle, string immunityTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagSatire(
        string memory memeTitle,
        string memory creator,
        string memory archetype,
        string memory immunityTag
    ) public onlySteward {
        registry.push(SatireEntry(memeTitle, creator, archetype, immunityTag));
        emit SatireTagged(memeTitle, creator, archetype);
        emit ImmunityGranted(memeTitle, immunityTag);
    }
}
