// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsequenceToPublicPayrollAuditGrid {
    address public steward;

    struct AuditEntry {
        string activity; // "Time theft, duplicate ID swipe"
        string clause; // "Scrollchain-sealed grid for payroll audit and taxpayer consequence"
        string emotionalTag;
        bool indexed;
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

    function indexPayrollAbuse(string memory activity, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(activity, clause, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
