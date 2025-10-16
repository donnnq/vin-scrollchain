// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerLegacyDAO {
    address public admin;

    struct LegacyEntry {
        string workerLabel;
        string legacyClause;
        string emotionalTag;
        bool archived;
    }

    LegacyEntry[] public legacies;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _legacyClause, string memory _emotionalTag) external onlyAdmin {
        legacies.push(LegacyEntry(_workerLabel, _legacyClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        legacies[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (LegacyEntry memory) {
        return legacies[index];
    }
}
