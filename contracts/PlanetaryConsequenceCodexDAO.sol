// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryConsequenceCodexDAO {
    address public admin;

    struct CodexEntry {
        string act;
        string corridor;
        string consequence;
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

    function submitEntry(string memory _act, string memory _corridor, string memory _consequence) external onlyAdmin {
        codex.push(CodexEntry(_act, _corridor, _consequence, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
