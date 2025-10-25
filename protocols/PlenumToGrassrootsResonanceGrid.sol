// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlenumToGrassrootsResonanceGrid {
    address public steward;

    struct ResonanceEntry {
        string plenumEvent; // "Fourth Plenary Scandal"
        string grassrootsSignal; // "Sheep blockade", "Public satire"
        string resonanceType; // "Symbolic protest", "Narrative echo"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    ResonanceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackResonance(string memory plenumEvent, string memory grassrootsSignal, string memory resonanceType, string memory emotionalTag) external onlySteward {
        entries.push(ResonanceEntry(plenumEvent, grassrootsSignal, resonanceType, emotionalTag, true, false));
    }

    function sealResonanceEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getResonanceEntry(uint256 index) external view returns (ResonanceEntry memory) {
        return entries[index];
    }
}
