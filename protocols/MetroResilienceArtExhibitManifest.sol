// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MetroResilienceArtExhibitManifest {
    address public steward;

    struct ExhibitEntry {
        string exhibitTitle;
        string artist;
        string timestamp;
        string metroRegion;
        string emotionalTag;
    }

    ExhibitEntry[] public manifest;

    event ArtExhibitBroadcasted(string exhibitTitle, string artist, string timestamp, string metroRegion, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastExhibit(
        string memory exhibitTitle,
        string memory artist,
        string memory timestamp,
        string memory metroRegion,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ExhibitEntry(exhibitTitle, artist, timestamp, metroRegion, emotionalTag));
        emit ArtExhibitBroadcasted(exhibitTitle, artist, timestamp, metroRegion, emotionalTag);
    }
}
