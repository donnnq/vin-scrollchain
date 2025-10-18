// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryProsecutionLedger {
    address public admin;

    struct ProsecutionEntry {
        string individual;
        string corridor;
        string emotionalTag;
        bool summoned;
        bool documented;
        bool transferredToJudiciary;
    }

    ProsecutionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProsecution(string memory individual, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(ProsecutionEntry(individual, corridor, emotionalTag, true, false, false));
    }

    function documentProsecution(uint256 index) external onlyAdmin {
        entries[index].documented = true;
    }

    function transferToJudiciary(uint256 index) external onlyAdmin {
        require(entries[index].documented, "Must be documented first");
        entries[index].transferredToJudiciary = true;
    }

    function getProsecutionEntry(uint256 index) external view returns (ProsecutionEntry memory) {
        return entries[index];
    }
}
