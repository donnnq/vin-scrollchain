// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployerRitualEthicsCodexDAO {
    address public admin;

    struct CodexEntry {
        string companyLabel;
        string ethicsClause;
        string emotionalTag;
        bool sealed;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _companyLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_companyLabel, _ethicsClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
