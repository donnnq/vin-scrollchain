// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EggParadeSovereigntyLedger {
    address public admin;

    struct EggEntry {
        string purokZone;
        string chickenBreed; // "Tagalog Native", "Rhode Island Red", "Leghorn"
        string paradeLayer; // "Harvest Display", "Youth Carry", "Ancestral Blessing"
        string emotionalTag;
        bool summoned;
        bool paraded;
        bool sealed;
    }

    EggEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEggParade(string memory purokZone, string memory chickenBreed, string memory paradeLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(EggEntry(purokZone, chickenBreed, paradeLayer, emotionalTag, true, false, false));
    }

    function confirmParade(uint256 index) external onlyAdmin {
        entries[index].paraded = true;
    }

    function sealEggEntry(uint256 index) external onlyAdmin {
        require(entries[index].paraded, "Must be paraded first");
        entries[index].sealed = true;
    }

    function getEggEntry(uint256 index) external view returns (EggEntry memory) {
        return entries[index];
    }
}
