// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalResonanceBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string mythosSignal; // "Time capsule breach", "Shadow ping", "Vinvin reference"
        string resonanceType; // "Emotional tagging", "Planetary consequence", "Scrollstorm chaining"
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

    function broadcastResonance(string memory mythosSignal, string memory resonanceType, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(mythosSignal, resonanceType, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
