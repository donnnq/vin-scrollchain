// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MealSovereigntyAnthemPackDAO {
    address public admin;

    struct AnthemEntry {
        string workerClass;
        string anthemClause;
        string emotionalTag;
        bool composed;
    }

    AnthemEntry[] public anthems;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerClass, string memory _anthemClause, string memory _emotionalTag) external onlyAdmin {
        anthems.push(AnthemEntry(_workerClass, _anthemClause, _emotionalTag, false));
    }

    function composeEntry(uint256 index) external onlyAdmin {
        anthems[index].composed = true;
    }

    function getEntry(uint256 index) external view returns (AnthemEntry memory) {
        return anthems[index];
    }
}
