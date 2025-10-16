// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerLoveDAO {
    address public admin;

    struct LoveEntry {
        string workerLabel;
        string loveClause;
        string emotionalTag;
        bool archived;
    }

    LoveEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _loveClause, string memory _emotionalTag) external onlyAdmin {
        entries.push(LoveEntry(_workerLabel, _loveClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (LoveEntry memory) {
        return entries[index];
    }
}
