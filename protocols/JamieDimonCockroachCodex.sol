// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JamieDimonCockroachCodex {
    address public admin;

    struct CockroachEntry {
        string metaphorOrigin;
        string fraudCluster;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool escalated;
        bool sealed;
    }

    CockroachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCockroach(string memory metaphorOrigin, string memory fraudCluster, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CockroachEntry(metaphorOrigin, fraudCluster, auditClause, emotionalTag, true, false, false));
    }

    function confirmEscalation(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function sealCockroachEntry(uint256 index) external onlyAdmin {
        require(entries[index].escalated, "Must be escalated first");
        entries[index].sealed = true;
    }

    function getCockroachEntry(uint256 index) external view returns (CockroachEntry memory) {
        return entries[index];
    }
}
