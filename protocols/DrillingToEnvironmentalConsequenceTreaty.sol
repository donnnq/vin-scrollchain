// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrillingToEnvironmentalConsequenceTreaty {
    address public steward;

    struct TreatyEntry {
        string site; // "Alaska Arctic Refuge"
        string clause; // "Scrollchain-sealed treaty for environmental consequence and planetary audit"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyDrilling(string memory site, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(site, clause, emotionalTag, true, false));
    }

    function sealDrillingEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getDrillingEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
