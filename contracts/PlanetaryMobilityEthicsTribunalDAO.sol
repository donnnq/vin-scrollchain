// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryMobilityEthicsTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string caseLabel;
        string ethicsClause;
        string emotionalTag;
        bool adjudicated;
    }

    TribunalEntry[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _caseLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        cases.push(TribunalEntry(_caseLabel, _ethicsClause, _emotionalTag, false));
    }

    function adjudicateEntry(uint256 index) external onlyAdmin {
        cases[index].adjudicated = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return cases[index];
    }
}
