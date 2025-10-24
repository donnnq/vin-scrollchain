// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SandroToCorruptionResistanceLedger {
    address public steward;

    struct ResistanceEntry {
        string figureName; // "Cong. Sandro Marcos"
        string publicSignal; // "Matatakot ang mga kurap", "Tatak Marcos"
        string resistanceType; // "Legislative fire", "Youth-led audit"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    ResistanceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logResistance(string memory figureName, string memory publicSignal, string memory resistanceType, string memory emotionalTag) external onlySteward {
        entries.push(ResistanceEntry(figureName, publicSignal, resistanceType, emotionalTag, true, false));
    }

    function sealResistanceEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getResistanceEntry(uint256 index) external view returns (ResistanceEntry memory) {
        return entries[index];
    }
}
