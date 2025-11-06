// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PBAVenueSovereigntyTreaty {
    address public steward;

    struct VenueEntry {
        string arenaName;
        string location;
        string legacyStatus;
        string emotionalTag;
    }

    VenueEntry[] public treaty;

    event PBAVenueTagged(string arenaName, string location, string legacyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagVenue(
        string memory arenaName,
        string memory location,
        string memory legacyStatus,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(VenueEntry(arenaName, location, legacyStatus, emotionalTag));
        emit PBAVenueTagged(arenaName, location, legacyStatus, emotionalTag);
    }
}
