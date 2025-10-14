// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorAccountabilityImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string contractorName;
        string accountabilityClause;
        string immunityTag;
        string emotionalTag;
        bool enforced;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _contractorName, string memory _accountabilityClause, string memory _immunityTag, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_contractorName, _accountabilityClause, _immunityTag, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
