// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedemptionToSettlementTracker {
    address public steward;

    struct SettlementEntry {
        string fundName; // "UnionBank PHP Equity Fund"
        string investorID; // "Vinvin"
        string redemptionDate; // "2025-10-27"
        string settlementDate; // "2025-10-30"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    SettlementEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackSettlement(string memory fundName, string memory investorID, string memory redemptionDate, string memory settlementDate, string memory emotionalTag) external onlySteward {
        entries.push(SettlementEntry(fundName, investorID, redemptionDate, settlementDate, emotionalTag, true, false));
    }

    function sealSettlementEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getSettlementEntry(uint256 index) external view returns (SettlementEntry memory) {
        return entries[index];
    }
}
