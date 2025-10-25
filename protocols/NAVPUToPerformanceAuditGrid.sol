// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NAVPUToPerformanceAuditGrid {
    address public steward;

    struct AuditEntry {
        string fundName; // "UnionBank PHP Equity Fund"
        string NAVPU; // "PHP 507.57"
        string volatility; // "19.00%"
        string sharpeRatio; // "-0.5677"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditPerformance(string memory fundName, string memory NAVPU, string memory volatility, string memory sharpeRatio, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(fundName, NAVPU, volatility, sharpeRatio, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
