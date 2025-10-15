// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeSpacesEnforcementCodexDAO {
    address public admin;

    struct CodexEntry {
        string institution;
        string enforcementClause;
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

    function submitEntry(string memory _institution, string memory _enforcementClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_institution, _enforcementClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
