// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerCelebrationDAO {
    address public admin;

    struct CelebrationEntry {
        string workerLabel;
        string celebrationClause;
        string emotionalTag;
        bool archived;
    }

    CelebrationEntry[] public celebrations;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _celebrationClause, string memory _emotionalTag) external onlyAdmin {
        celebrations.push(CelebrationEntry(_workerLabel, _celebrationClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        celebrations[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (CelebrationEntry memory) {
        return celebrations[index];
    }
}
