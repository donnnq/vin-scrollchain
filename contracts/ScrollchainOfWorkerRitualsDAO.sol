// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerRitualsDAO {
    address public admin;

    struct RitualEntry {
        string workerLabel;
        string ritualClause;
        string emotionalTag;
        bool archived;
    }

    RitualEntry[] public rituals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _ritualClause, string memory _emotionalTag) external onlyAdmin {
        rituals.push(RitualEntry(_workerLabel, _ritualClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        rituals[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (RitualEntry memory) {
        return rituals[index];
    }
}
