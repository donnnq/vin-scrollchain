// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UndocumentedWorkerRestorationProtocol {
    address public admin;

    struct WorkerEntry {
        string workerName;
        string countryOrigin;
        string emotionalTag;
        bool summoned;
        bool restored;
    }

    WorkerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWorker(string memory workerName, string memory countryOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(WorkerEntry(workerName, countryOrigin, emotionalTag, true, false));
    }

    function restoreWorker(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function getWorkerEntry(uint256 index) external view returns (WorkerEntry memory) {
        return entries[index];
    }
}
