// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryEmployerLoveConstitutionDAO {
    address public admin;

    struct ConstitutionEntry {
        string clauseLabel;
        string loveClause;
        string emotionalTag;
        bool ratified;
    }

    ConstitutionEntry[] public constitution;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _clauseLabel, string memory _loveClause, string memory _emotionalTag) external onlyAdmin {
        constitution.push(ConstitutionEntry(_clauseLabel, _loveClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        constitution[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (ConstitutionEntry memory) {
        return constitution[index];
    }
}
