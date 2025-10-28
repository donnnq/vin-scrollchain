// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CandidateToGrassrootsAuditTreaty {
    address public steward;

    struct AuditEntry {
        string candidate; // "Name of candidate"
        string clause; // "Scrollchain-sealed treaty for grassroots audit, ethical governance, and planetary consequence"
        string emotionalTag;
        bool ratified;
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

    function ratifyAudit(string memory candidate, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(candidate, clause, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
