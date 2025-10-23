// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanitarianCorridorActivationGrid {
    address public steward;

    struct CorridorEntry {
        string corridorName; // "Rafah Crossing", "Kerem Shalom", "Erez"
        string activationSignal; // "UN mandate", "ICJ ruling", "Ceasefire compliance"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    CorridorEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateCorridor(string memory corridorName, string memory activationSignal, string memory emotionalTag) external onlySteward {
        entries.push(CorridorEntry(corridorName, activationSignal, emotionalTag, true, false));
    }

    function sealCorridorEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getCorridorEntry(uint256 index) external view returns (CorridorEntry memory) {
        return entries[index];
    }
}
