// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalMandateDefenseLedger {
    address public admin;

    struct DefenseEntry {
        string agency; // "Ombudsman", "COA"
        string mandateThreat; // "Redundant body proposal", "Jurisdiction dilution"
        string defenseAction; // "Funding reinforcement", "Legal clarification", "Public support"
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

    function defendMandate(string memory agency, string memory mandateThreat, string memory defenseAction, string memory emotionalTag) external onlyAdmin {
        entries.push(DefenseEntry(agency, mandateThreat, defenseAction, emotionalTag, true, false));
    }

    function sealDefenseEntry(uint256 index) external onlyAdmin {
        require(entries[index].defended, "Must be defended first");
        entries[index].sealed = true;
    }

    function getDefenseEntry(uint256 index) external view returns (DefenseEntry memory) {
        return entries[index];
    }
}
