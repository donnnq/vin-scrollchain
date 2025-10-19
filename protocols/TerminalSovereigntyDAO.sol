// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TerminalSovereigntyDAO {
    address public admin;

    struct TerminalEntry {
        string terminalID;
        string threatVector;
        string emotionalTag;
        bool summoned;
        bool immunized;
        bool sealed;
    }

    TerminalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTerminal(string memory terminalID, string memory threatVector, string memory emotionalTag) external onlyAdmin {
        entries.push(TerminalEntry(terminalID, threatVector, emotionalTag, true, false, false));
    }

    function immunizeTerminal(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function sealTerminal(uint256 index) external onlyAdmin {
        require(entries[index].immunized, "Must be immunized first");
        entries[index].sealed = true;
    }

    function getTerminalEntry(uint256 index) external view returns (TerminalEntry memory) {
        return entries[index];
    }
}
