// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevenueEquityCodex {
    address public admin;

    struct RevenueEntry {
        string taxType;
        uint projectedYield;
        string economicImpact;
        string emotionalTag;
        bool modeled;
        bool audited;
    }

    RevenueEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logRevenue(string memory taxType, uint projectedYield, string memory economicImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(RevenueEntry(taxType, projectedYield, economicImpact, emotionalTag, true, false));
    }

    function auditRevenue(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getRevenue(uint256 index) external view returns (RevenueEntry memory) {
        return entries[index];
    }
}
