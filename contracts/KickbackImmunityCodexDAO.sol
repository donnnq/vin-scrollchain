// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KickbackImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string projectName;
        uint256 budgetAmount;
        string auditClause;
        string emotionalTag;
        bool sealed;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _projectName, uint256 _budgetAmount, string memory _auditClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_projectName, _budgetAmount, _auditClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
