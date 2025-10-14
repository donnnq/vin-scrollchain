// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryJusticeCodexDAO {
    address public admin;

    struct CodexEntry {
        string principle;
        string corridor;
        string enforcementProtocol;
        bool ratified;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCodex(string memory _principle, string memory _corridor, string memory _enforcementProtocol) external onlyAdmin {
        codex.push(CodexEntry(_principle, _corridor, _enforcementProtocol, false));
    }

    function ratifyCodex(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getCodex(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
