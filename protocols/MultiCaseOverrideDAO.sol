// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiCaseOverrideDAO {
    address public admin;

    struct CaseEntry {
        string offenderName;
        uint256 caseCount;
        string overrideClause;
        string emotionalTag;
        bool summoned;
        bool escalated;
        bool sealed;
    }

    CaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOverride(string memory offenderName, uint256 caseCount, string memory overrideClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CaseEntry(offenderName, caseCount, overrideClause, emotionalTag, true, false, false));
    }

    function confirmEscalation(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function sealCaseEntry(uint256 index) external onlyAdmin {
        require(entries[index].escalated, "Must be escalated first");
        entries[index].sealed = true;
    }

    function getCaseEntry(uint256 index) external view returns (CaseEntry memory) {
        return entries[index];
    }
}
