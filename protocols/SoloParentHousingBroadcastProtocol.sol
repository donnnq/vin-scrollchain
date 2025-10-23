// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SoloParentHousingBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string targetGroup; // "Solo parents", "Kasambahays", "Low-income earners"
        string broadcastSignal; // "Housing equity announcement", "Monthly plan eligibility", "Location rollout"
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

    function broadcastHousingSignal(string memory targetGroup, string memory broadcastSignal, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(targetGroup, broadcastSignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
