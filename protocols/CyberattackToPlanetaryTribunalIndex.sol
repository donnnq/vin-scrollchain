// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberattackToPlanetaryTribunalIndex {
    address public steward;

    struct TribunalEntry {
        string attackName;
        string affectedCorridor; // "Government", "Finance", "Education"
        string tribunalType; // "Planetary hearing", "Interagency review", "Global arbitration"
        string emotionalTag;
        bool summoned;
        bool sealed;
    }

    TribunalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function summonTribunal(string memory attackName, string memory affectedCorridor, string memory tribunalType, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(attackName, affectedCorridor, tribunalType, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].summoned, "Must be summoned first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
