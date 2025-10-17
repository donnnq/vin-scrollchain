// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulinaryJusticeCodex {
    address public admin;

    struct JusticeEntry {
        string recipeName;
        string originRegion;
        string emotionalTag;
        bool summoned;
        bool defended;
    }

    JusticeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonJustice(string memory recipeName, string memory originRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(JusticeEntry(recipeName, originRegion, emotionalTag, true, false));
    }

    function defendRecipe(uint256 index) external onlyAdmin {
        entries[index].defended = true;
    }

    function getJusticeEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
