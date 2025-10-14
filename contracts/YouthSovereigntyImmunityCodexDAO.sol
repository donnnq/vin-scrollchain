// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthSovereigntyImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string purokOrBarangay;
        string sovereigntyThreat;
        string immunityClause;
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

    function submitEntry(string memory _purokOrBarangay, string memory _sovereigntyThreat, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_purokOrBarangay, _sovereigntyThreat, _immunityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
