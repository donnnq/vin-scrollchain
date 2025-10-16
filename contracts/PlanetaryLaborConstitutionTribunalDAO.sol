// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryLaborConstitutionTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string clauseLabel;
        string constitutionClause;
        string emotionalTag;
        bool ratified;
    }

    TribunalEntry[] public constitution;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _clauseLabel, string memory _constitutionClause, string memory _emotionalTag) external onlyAdmin {
        constitution.push(TribunalEntry(_clauseLabel, _constitutionClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        constitution[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return constitution[index];
    }
}
