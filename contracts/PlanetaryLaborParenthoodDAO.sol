// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryLaborParenthoodDAO {
    address public admin;

    struct ParenthoodEntry {
        string companyLabel;
        string parenthoodClause;
        string emotionalTag;
        bool ratified;
    }

    ParenthoodEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _companyLabel, string memory _parenthoodClause, string memory _emotionalTag) external onlyAdmin {
        entries.push(ParenthoodEntry(_companyLabel, _parenthoodClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (ParenthoodEntry memory) {
        return entries[index];
    }
}
