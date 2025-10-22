// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract COAJurisdictionDefenseProtocol {
    address public admin;

    struct DefenseEntry {
        string threatType; // "Redundant investigative body", "Jurisdiction overlap"
        string defenseAction; // "Legal clarification", "Public statement", "Budget reinforcement"
        string emotionalTag;
        bool defended;
        bool sealed;
    }

    DefenseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function defendJurisdiction(string memory threatType, string memory defenseAction, string memory emotionalTag) external onlyAdmin {
        entries.push(DefenseEntry(threatType, defenseAction, emotionalTag, true, false));
    }

    function sealDefenseEntry(uint256 index) external onlyAdmin {
        require(entries[index].defended, "Must be defended first");
        entries[index].sealed = true;
    }

    function getDefenseEntry(uint256 index) external view returns (DefenseEntry memory) {
        return entries[index];
    }
}
