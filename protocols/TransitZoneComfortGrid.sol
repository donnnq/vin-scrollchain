// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransitZoneComfortGrid {
    address public admin;

    struct ComfortEntry {
        string zone;
        string comfortLevel; // "Unshaded", "Bench-Free", "Sanctum-Ready"
        string gridClause;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    ComfortEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonComfortGrid(string memory zone, string memory comfortLevel, string memory gridClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ComfortEntry(zone, comfortLevel, gridClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealComfortEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getComfortEntry(uint256 index) external view returns (ComfortEntry memory) {
        return entries[index];
    }
}
