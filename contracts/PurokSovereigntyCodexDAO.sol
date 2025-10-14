// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokSovereigntyCodexDAO {
    address public admin;

    struct CodexEntry {
        string purok;
        string principle;
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

    function submitEntry(string memory _purok, string memory _principle, string memory _enforcementProtocol) external onlyAdmin {
        codex.push(CodexEntry(_purok, _principle, _enforcementProtocol, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
