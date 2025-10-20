// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MilitaryIntegrityDAO {
    address public admin;

    struct IntegrityEntry {
        string officerName;
        string rank;
        string violationClause;
        string emotionalTag;
        bool summoned;
        bool investigated;
        bool sealed;
    }

    IntegrityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIntegrityAudit(string memory officerName, string memory rank, string memory violationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(IntegrityEntry(officerName, rank, violationClause, emotionalTag, true, false, false));
    }

    function confirmInvestigation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sealIntegrityEntry(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sealed = true;
    }

    function getIntegrityEntry(uint256 index) external view returns (IntegrityEntry memory) {
        return entries[index];
    }
}
