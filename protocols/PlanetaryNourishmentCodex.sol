// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryNourishmentCodex {
    address public admin;

    struct NourishmentEntry {
        string item;
        string culturalOrigin;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool protected;
    }

    NourishmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonNourishment(string memory item, string memory culturalOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(NourishmentEntry(item, culturalOrigin, emotionalTag, true, false, false));
    }

    function archiveNourishment(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function protectNourishment(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getNourishmentEntry(uint256 index) external view returns (NourishmentEntry memory) {
        return entries[index];
    }
}
