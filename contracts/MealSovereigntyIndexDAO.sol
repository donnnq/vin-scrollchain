// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MealSovereigntyIndexDAO {
    address public admin;

    struct IndexEntry {
        string workerClass;
        string indexClause;
        string emotionalTag;
        bool published;
    }

    IndexEntry[] public index;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerClass, string memory _indexClause, string memory _emotionalTag) external onlyAdmin {
        index.push(IndexEntry(_workerClass, _indexClause, _emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        index[index].published = true;
    }

    function getEntry(uint256 index) external view returns (IndexEntry memory) {
        return index[index];
    }
}
