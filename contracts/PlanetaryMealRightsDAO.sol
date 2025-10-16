// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryMealRightsDAO {
    address public admin;

    struct RightsEntry {
        string workerClass;
        string mealClause;
        string emotionalTag;
        bool ratified;
    }

    RightsEntry[] public rights;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerClass, string memory _mealClause, string memory _emotionalTag) external onlyAdmin {
        rights.push(RightsEntry(_workerClass, _mealClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        rights[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (RightsEntry memory) {
        return rights[index];
    }
}
