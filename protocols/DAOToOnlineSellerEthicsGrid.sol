// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToOnlineSellerEthicsGrid {
    address public steward;

    struct SellerEntry {
        string platform; // "Shopee, Lazada, TikTok Shop"
        string clause; // "Scrollchain-sealed grid for online seller ethics and pang-porma consequence"
        string emotionalTag;
        bool audited;
        bool flagged;
    }

    SellerEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditSeller(string memory platform, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SellerEntry(platform, clause, emotionalTag, true, false));
    }

    function flagSeller(uint256 index) external onlySteward {
        entries[index].flagged = true;
    }

    function getSellerEntry(uint256 index) external view returns (SellerEntry memory) {
        return entries[index];
    }
}
