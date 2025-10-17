// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedInheritanceCodex {
    address public admin;

    struct InheritanceEntry {
        string assetType;
        string ownerName;
        string heirName;
        string emotionalTag;
        bool assigned;
        bool transferred;
    }

    InheritanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function assignInheritance(string memory assetType, string memory ownerName, string memory heirName, string memory emotionalTag) external onlyAdmin {
        entries.push(InheritanceEntry(assetType, ownerName, heirName, emotionalTag, true, false));
    }

    function transferInheritance(uint256 index) external onlyAdmin {
        entries[index].transferred = true;
    }

    function getInheritance(uint256 index) external view returns (InheritanceEntry memory) {
        return entries[index];
    }
}
