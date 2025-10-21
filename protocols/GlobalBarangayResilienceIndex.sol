// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalBarangayResilienceIndex {
    address public admin;

    struct IndexEntry {
        string barangay;
        string resilienceScore; // "High", "Moderate", "Low", "Critical"
        string indexClause;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    IndexEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResilienceIndex(string memory barangay, string memory resilienceScore, string memory indexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(IndexEntry(barangay, resilienceScore, indexClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealIndexEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getIndexEntry(uint256 index) external view returns (IndexEntry memory) {
        return entries[index];
    }
}
