// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryTravelerDignityCodexDAO {
    address public admin;

    struct CodexEntry {
        string travelerLabel;
        string dignityClause;
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

    function submitEntry(string memory _travelerLabel, string memory _dignityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_travelerLabel, _dignityClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
