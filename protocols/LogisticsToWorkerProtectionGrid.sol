// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LogisticsToWorkerProtectionGrid {
    address public steward;

    struct ProtectionEntry {
        string platform; // "Shopee, Lazada"
        string protectionClause; // "No forced quotas, transparent penalties, emergency support hotline"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    ProtectionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateProtection(string memory platform, string memory protectionClause, string memory emotionalTag) external onlySteward {
        entries.push(ProtectionEntry(platform, protectionClause, emotionalTag, true, false));
    }

    function sealProtectionEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
