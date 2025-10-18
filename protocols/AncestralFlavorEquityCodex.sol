// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralFlavorEquityCodex {
    address public admin;

    struct FlavorEntry {
        string ingredient;
        string region;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool protected;
    }

    FlavorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFlavor(string memory ingredient, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(FlavorEntry(ingredient, region, emotionalTag, true, false, false));
    }

    function archiveFlavor(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function protectFlavor(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getFlavorEntry(uint256 index) external view returns (FlavorEntry memory) {
        return entries[index];
    }
}
