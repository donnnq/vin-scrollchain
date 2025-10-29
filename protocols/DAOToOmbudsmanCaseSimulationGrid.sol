// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToOmbudsmanCaseSimulationGrid {
    address public steward;

    struct CaseEntry {
        string respondent; // "Jinggoy Estrada, Joel Villanueva, Zaldy Co"
        string clause; // "Scrollchain-sealed grid for Ombudsman case simulation and prosecutorial consequence"
        string emotionalTag;
        bool simulated;
        bool sustained;
    }

    CaseEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateCase(string memory respondent, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(CaseEntry(respondent, clause, emotionalTag, true, true));
    }

    function getCaseEntry(uint256 index) external view returns (CaseEntry memory) {
        return entries[index];
    }
}
