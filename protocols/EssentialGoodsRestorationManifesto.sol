// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EssentialGoodsRestorationManifesto {
    address public admin;

    struct GoodsEntry {
        string product;
        string reasonForDisappearance;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool restored;
    }

    GoodsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGoods(string memory product, string memory reasonForDisappearance, string memory emotionalTag) external onlyAdmin {
        entries.push(GoodsEntry(product, reasonForDisappearance, emotionalTag, true, false, false));
    }

    function auditGoods(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function restoreGoods(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].restored = true;
    }

    function getGoodsEntry(uint256 index) external view returns (GoodsEntry memory) {
        return entries[index];
    }
}
