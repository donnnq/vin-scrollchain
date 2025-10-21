// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageDessertArchive {
    address public admin;

    struct DessertEntry {
        string dessertName; // "Sapin-Sapin", "Kalamay", "Pichi-Pichi", "Bibingka"
        string originPurok;
        string archiveLayer; // "Ingredient Integrity", "Cooking Ritual", "Ancestral Story"
        string emotionalTag;
        bool summoned;
        bool archived;
        bool sealed;
    }

    DessertEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDessert(string memory dessertName, string memory originPurok, string memory archiveLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(DessertEntry(dessertName, originPurok, archiveLayer, emotionalTag, true, false, false));
    }

    function confirmArchiving(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function sealDessertEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getDessertEntry(uint256 index) external view returns (DessertEntry memory) {
        return entries[index];
    }
}
