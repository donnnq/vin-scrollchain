// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanEquityCodexDAO {
    address public admin;

    struct CodexEntry {
        string city;
        string principle;
        string implementationPath;
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

    function submitEntry(string memory _city, string memory _principle, string memory _implementationPath) external onlyAdmin {
        codex.push(CodexEntry(_city, _principle, _implementationPath, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
