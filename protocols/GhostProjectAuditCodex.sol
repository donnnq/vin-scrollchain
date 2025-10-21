// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectAuditCodex {
    address public admin;

    struct GhostEntry {
        string projectName;
        string region;
        string ghostType; // "Nonexistent Site", "Unfinished Build", "Paper-Only Budget"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    GhostEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGhostAudit(string memory projectName, string memory region, string memory ghostType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(GhostEntry(projectName, region, ghostType, codexClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealGhostEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getGhostEntry(uint256 index) external view returns (GhostEntry memory) {
        return entries[index];
    }
}
