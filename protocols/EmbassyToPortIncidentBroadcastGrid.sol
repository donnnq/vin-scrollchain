// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmbassyToPortIncidentBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string embassyLocation; // "Washington D.C.", "Los Angeles"
        string incidentType; // "Visa revocation", "Forced deportation", "Legal denial"
        string broadcastChannel; // "TV Patrol", "Consular bulletin", "Scrollchain ledger"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastIncident(string memory embassyLocation, string memory incidentType, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(embassyLocation, incidentType, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
