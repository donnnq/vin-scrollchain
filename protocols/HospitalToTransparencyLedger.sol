// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HospitalToTransparencyLedger {
    address public steward;

    struct LedgerEntry {
        string hospitalName; // "Bulacan Medical Center"
        string transparencyGap; // "Unavailable diagnostics, unclear referrals, no public notice"
        string auditClause; // "Real-time service availability dashboard, procurement logs, patient feedback loop"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    LedgerEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logTransparency(string memory hospitalName, string memory transparencyGap, string memory auditClause, string memory emotionalTag) external onlySteward {
        entries.push(LedgerEntry(hospitalName, transparencyGap, auditClause, emotionalTag, true, false));
    }

    function sealLedgerEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
