// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastToCitizenOversightTreaty {
    address public steward;

    struct OversightEntry {
        string hearingTopic; // "Senate Bill 1215"
        string broadcastMethod; // "ABS-CBN stream", "Scrollchain channel", "Public archive"
        string civicSignal; // "Citizen audit", "Public resonance", "Transparency ritual"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastOversight(string memory hearingTopic, string memory broadcastMethod, string memory civicSignal, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(hearingTopic, broadcastMethod, civicSignal, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
