// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastToDiasporaOversightIndex {
    address public steward;

    struct OversightEntry {
        string hearingTopic; // "Senate Bill 1215"
        string broadcastChannel; // "ABS-CBN Global", "Scrollchain diaspora stream", "Public archive"
        string diasporaSignal; // "Global audit", "Citizen resonance", "Planetary consequence"
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

    function broadcastDiaspora(string memory hearingTopic, string memory broadcastChannel, string memory diasporaSignal, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(hearingTopic, broadcastChannel, diasporaSignal, emotionalTag, true, false));
    }

    function sealDiasporaEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getDiasporaEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
