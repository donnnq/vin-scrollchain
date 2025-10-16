// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecurityEvidenceEthicsTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string footageLabel;
        string ethicsClause;
        string emotionalTag;
        bool adjudicated;
    }

    TribunalEntry[] public trials;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory footageLabel, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        trials.push(TribunalEntry(footageLabel, ethicsClause, emotionalTag, false));
    }

    function adjudicateEntry(uint256 index) external onlyAdmin {
        trials[index].adjudicated = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return trials[index];
    }
}
