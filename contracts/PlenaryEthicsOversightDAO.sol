// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlenaryEthicsOversightDAO {
    address public admin;

    struct OversightEntry {
        string councilorName;
        string ethicsConcern;
        string oversightClause;
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

    function submitEntry(string memory _councilorName, string memory _ethicsConcern, string memory _oversightClause, string memory _emotionalTag) external onlyAdmin {
        oversight.push(OversightEntry(_councilorName, _ethicsConcern, _oversightClause, _emotionalTag, false));
    }

    function markReviewed(uint256 index) external onlyAdmin {
        oversight[index].reviewed = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return oversight[index];
    }
}
