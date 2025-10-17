// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UltimateGoBagCodex {
    address public admin;

    struct GoBagEntry {
        string region;
        string contents;
        string emotionalTag;
        bool distributed;
        bool verified;
    }

    GoBagEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function distributeGoBag(string memory region, string memory contents, string memory emotionalTag) external onlyAdmin {
        entries.push(GoBagEntry(region, contents, emotionalTag, true, false));
    }

    function verifyDistribution(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getGoBagEntry(uint256 index) external view returns (GoBagEntry memory) {
        return entries[index];
    }
}
