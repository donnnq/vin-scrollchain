// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthUprisingEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string movementName;
        string ethicalTheme;
        string emotionalTag;
        bool summoned;
        bool ratified;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthics(string memory movementName, string memory ethicalTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(movementName, ethicalTheme, emotionalTag, true, false));
    }

    function ratifyEthics(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
