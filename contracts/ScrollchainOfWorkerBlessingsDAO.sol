// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerBlessingsDAO {
    address public admin;

    struct BlessingEntry {
        string workerLabel;
        string blessingClause;
        string emotionalTag;
        bool archived;
    }

    BlessingEntry[] public blessings;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _blessingClause, string memory _emotionalTag) external onlyAdmin {
        blessings.push(BlessingEntry(_workerLabel, _blessingClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        blessings[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (BlessingEntry memory) {
        return blessings[index];
    }
}
