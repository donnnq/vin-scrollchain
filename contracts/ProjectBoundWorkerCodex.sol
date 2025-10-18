// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProjectBoundWorkerCodex {
    address public admin;

    struct WorkerEntry {
        string workerName;
        string projectName;
        string emotionalTag;
        bool summoned;
        bool archived;
    }

    WorkerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWorker(string memory workerName, string memory projectName, string memory emotionalTag) external onlyAdmin {
        entries.push(WorkerEntry(workerName, projectName, emotionalTag, true, false));
    }

    function archiveWorker(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getWorkerEntry(uint256 index) external view returns (WorkerEntry memory) {
        return entries[index];
    }
}
