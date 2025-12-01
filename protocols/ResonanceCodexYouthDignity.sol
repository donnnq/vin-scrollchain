// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ResonanceCodexYouthDignity {
    string public batchID = "1321.9.222";
    string public steward = "Vinvin";

    address public admin;

    struct CodexEntry {
        string theme;       // civic participation, generational equity, youth dignity
        string narrative;   // how youth dignity reshapes communal trust and validator-grade consequence
        uint256 timestamp;
    }

    CodexEntry[] public entries;

    event CodexLogged(string theme, string narrative);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCodex(string memory theme, string memory narrative) public onlyAdmin {
        entries.push(CodexEntry(theme, narrative, block.timestamp));
        emit CodexLogged(theme, narrative);
    }

    function getCodex(uint256 index) public view returns (string memory theme, string memory narrative, uint256 timestamp) {
        CodexEntry memory c = entries[index];
        return (c.theme, c.narrative, c.timestamp);
    }
}
