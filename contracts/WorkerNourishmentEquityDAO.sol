// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerNourishmentEquityDAO {
    address public admin;

    struct MealEntry {
        string workerLabel;
        string nourishmentClause;
        string emotionalTag;
        bool approved;
    }

    MealEntry[] public meals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _nourishmentClause, string memory _emotionalTag) external onlyAdmin {
        meals.push(MealEntry(_workerLabel, _nourishmentClause, _emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        meals[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (MealEntry memory) {
        return meals[index];
    }
}
