// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AidDistributionEquityCodex {
    address public admin;

    struct AidEntry {
        string aidType;
        string purokName;
        uint quantityOrAmount;
        string emotionalTag;
        bool distributed;
        bool verified;
    }

    AidEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAid(string memory aidType, string memory purokName, uint quantityOrAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(AidEntry(aidType, purokName, quantityOrAmount, emotionalTag, true, false));
    }

    function verifyAid(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getAid(uint256 index) external view returns (AidEntry memory) {
        return entries[index];
    }
}
