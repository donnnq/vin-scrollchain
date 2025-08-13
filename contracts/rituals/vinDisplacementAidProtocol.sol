// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinDisplacementAidProtocol {
    address public steward;
    uint256 public aidAmount = 5000;

    struct DisplacedWorker {
        string name;
        bool isDisplaced;
        bool aidGranted;
    }

    mapping(address => DisplacedWorker) public workers;

    event WorkerRegistered(address indexed worker, string name);
    event AidGranted(address indexed worker, string name, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can perform this action");
        _;
    }

    function registerDisplacedWorker(address workerAddress, string memory name) public onlySteward {
        workers[workerAddress] = DisplacedWorker(name, true, false);
        emit WorkerRegistered(workerAddress, name);
    }

    function grantAid(address workerAddress) public onlySteward {
        DisplacedWorker storage worker = workers[workerAddress];
        require(worker.isDisplaced, "Worker not marked as displaced");
        require(!worker.aidGranted, "Aid already granted");

        worker.aidGranted = true;
        emit AidGranted(workerAddress, worker.name, aidAmount);
    }

    function getWorkerStatus(address workerAddress) public view returns (string memory, bool, bool) {
        DisplacedWorker memory w = workers[workerAddress];
        return (w.name, w.isDisplaced, w.aidGranted);
    }
}
