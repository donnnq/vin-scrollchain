// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockchainForensicsOversightDAO {
    address public admin;

    struct OversightEntry {
        string caseLabel;
        string forensicClause;
        string emotionalTag;
        bool reviewed;
    }

    OversightEntry[] public oversight;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _caseLabel, string memory _forensicClause, string memory _emotionalTag) external onlyAdmin {
        oversight.push(OversightEntry(_caseLabel, _forensicClause, _emotionalTag, false));
    }

    function markReviewed(uint256 index) external onlyAdmin {
        oversight[index].reviewed = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return oversight[index];
    }
}
