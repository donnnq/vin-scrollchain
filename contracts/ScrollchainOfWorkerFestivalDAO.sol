// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerFestivalDAO {
    address public admin;

    struct FestivalEntry {
        string workerLabel;
        string festivalClause;
        string emotionalTag;
        bool archived;
    }

    FestivalEntry[] public festivals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _festivalClause, string memory _emotionalTag) external onlyAdmin {
        festivals.push(FestivalEntry(_workerLabel, _festivalClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        festivals[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (FestivalEntry memory) {
        return festivals[index];
    }
}
