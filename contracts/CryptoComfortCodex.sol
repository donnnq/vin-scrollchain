// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoComfortCodex {
    address public admin;

    struct ComfortEntry {
        string assetType;
        string userGroup;
        string comfortMetric;
        string emotionalTag;
        bool deployed;
        bool sovereign;
    }

    ComfortEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployComfort(string memory assetType, string memory userGroup, string memory comfortMetric, string memory emotionalTag) external onlyAdmin {
        entries.push(ComfortEntry(assetType, userGroup, comfortMetric, emotionalTag, true, false));
    }

    function markSovereign(uint256 index) external onlyAdmin {
        entries[index].sovereign = true;
    }

    function getComfort(uint256 index) external view returns (ComfortEntry memory) {
        return entries[index];
    }
}
