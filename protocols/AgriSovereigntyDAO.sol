// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriSovereigntyDAO {
    address public admin;

    struct CommodityEntry {
        string commodity;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    CommodityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCommodity(string memory commodity, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(CommodityEntry(commodity, region, emotionalTag, true, false, false));
    }

    function protectCommodity(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealProtection(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getCommodityEntry(uint256 index) external view returns (CommodityEntry memory) {
        return entries[index];
    }
}
