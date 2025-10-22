// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalMarketDiversificationProtocol {
    address public admin;

    struct DiversificationEntry {
        string country; // "Philippines"
        string currentDependency; // "US"
        string newTargetMarkets; // "EU", "ASEAN", "Middle East"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    DiversificationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployDiversification(string memory country, string memory currentDependency, string memory newTargetMarkets, string memory emotionalTag) external onlyAdmin {
        entries.push(DiversificationEntry(country, currentDependency, newTargetMarkets, emotionalTag, true, false));
    }

    function sealDiversificationEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getDiversificationEntry(uint256 index) external view returns (DiversificationEntry memory) {
        return entries[index];
    }
}
