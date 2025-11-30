// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToWorkerProtectionGrid {
    string public batchID = "1321.9.204";
    string public steward = "Vinvin";

    address public admin;

    struct Worker {
        string role;        // front desk, housekeeping, food service
        string status;      // protected, pending, audited
        uint256 timestamp;
    }

    Worker[] public workers;

    event WorkerLogged(string role, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logWorker(string memory role, string memory status) public onlyAdmin {
        workers.push(Worker(role, status, block.timestamp));
        emit WorkerLogged(role, status);
    }

    function getWorker(uint256 index) public view returns (string memory role, string memory status, uint256 timestamp) {
        Worker memory w = workers[index];
        return (w.role, w.status, w.timestamp);
    }
}
