// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GOBagEquityCodex {
    address public admin;

    struct GOEntry {
        string purokName;
        string distributionStatus;
        string emotionalTag;
        bool funded;
        bool delivered;
    }

    GOEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logDistribution(string memory purokName, string memory distributionStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(GOEntry(purokName, distributionStatus, emotionalTag, true, false));
    }

    function markDelivered(uint256 index) external onlyAdmin {
        entries[index].delivered = true;
    }

    function getGOEntry(uint256 index) external view returns (GOEntry memory) {
        return entries[index];
    }
}
