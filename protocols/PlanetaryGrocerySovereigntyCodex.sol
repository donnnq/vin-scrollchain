// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryGrocerySovereigntyCodex {
    address public admin;

    struct GroceryEntry {
        string itemName;
        string storeOrigin;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool restored;
    }

    GroceryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonItem(string memory itemName, string memory storeOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(GroceryEntry(itemName, storeOrigin, emotionalTag, true, false, false));
    }

    function auditItem(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function restoreItem(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].restored = true;
    }

    function getGroceryEntry(uint256 index) external view returns (GroceryEntry memory) {
        return entries[index];
    }
}
