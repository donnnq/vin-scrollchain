// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryReligiousFreedomCodex {
    address public admin;

    struct FreedomEntry {
        string faith;
        string country;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool archived;
    }

    FreedomEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFreedom(string memory faith, string memory country, string memory emotionalTag) external onlyAdmin {
        entries.push(FreedomEntry(faith, country, emotionalTag, true, false, false));
    }

    function protectFreedom(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function archiveFreedom(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getFreedomEntry(uint256 index) external view returns (FreedomEntry memory) {
        return entries[index];
    }
}
