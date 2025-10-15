// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresidentialVetoImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string billLabel;
        string immunityClause;
        string emotionalTag;
        bool shielded;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _billLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_billLabel, _immunityClause, _emotionalTag, false));
    }

    function markShielded(uint256 index) external onlyAdmin {
        codex[index].shielded = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
