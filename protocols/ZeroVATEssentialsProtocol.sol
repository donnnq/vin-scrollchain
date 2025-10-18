// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroVATEssentialsProtocol {
    address public admin;

    struct ItemEntry {
        string itemName;
        string category;
        string emotionalTag;
        bool summoned;
        bool exempted;
        bool sealed;
    }

    ItemEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonItem(string memory itemName, string memory category, string memory emotionalTag) external onlyAdmin {
        entries.push(ItemEntry(itemName, category, emotionalTag, true, false, false));
    }

    function exemptItem(uint256 index) external onlyAdmin {
        entries[index].exempted = true;
    }

    function sealExemption(uint256 index) external onlyAdmin {
        require(entries[index].exempted, "Must be exempted first");
        entries[index].sealed = true;
    }

    function getItemEntry(uint256 index) external view returns (ItemEntry memory) {
        return entries[index];
    }
}
