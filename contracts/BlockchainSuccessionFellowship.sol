// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockchainSuccessionFellowship {
    address public admin;

    struct SuccessionEntry {
        string assetType;
        string originalOwner;
        string designatedHeir;
        string emotionalTag;
        bool assigned;
        bool transferred;
    }

    SuccessionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function assignSuccession(string memory assetType, string memory originalOwner, string memory designatedHeir, string memory emotionalTag) external onlyAdmin {
        entries.push(SuccessionEntry(assetType, originalOwner, designatedHeir, emotionalTag, true, false));
    }

    function transferSuccession(uint256 index) external onlyAdmin {
        entries[index].transferred = true;
    }

    function getSuccession(uint256 index) external view returns (SuccessionEntry memory) {
        return entries[index];
    }
}
