// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TilapiaCookoffRitualGrid {
    address public admin;

    struct CookoffEntry {
        string barangay;
        string dishType; // "Inihaw", "Ginataan", "Adobo", "Escabeche"
        string ritualLayer; // "Youth Chef", "Ancestral Recipe", "Judging Panel"
        string emotionalTag;
        bool summoned;
        bool cooked;
        bool sealed;
    }

    CookoffEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCookoff(string memory barangay, string memory dishType, string memory ritualLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(CookoffEntry(barangay, dishType, ritualLayer, emotionalTag, true, false, false));
    }

    function confirmCooking(uint256 index) external onlyAdmin {
        entries[index].cooked = true;
    }

    function sealCookoffEntry(uint256 index) external onlyAdmin {
        require(entries[index].cooked, "Must be cooked first");
        entries[index].sealed = true;
    }

    function getCookoffEntry(uint256 index) external view returns (CookoffEntry memory) {
        return entries[index];
    }
}
