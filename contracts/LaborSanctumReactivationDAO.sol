// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title LaborSanctumReactivationDAO
 * @dev Emotionally tagged smart contract to restore deported workers to active labor sanctums
 * immediately upon reporting — no fees, no punishment, just dignity and planetary consequence.
 */

contract LaborSanctumReactivationDAO {
    address public steward;

    struct Worker {
        address identity;
        bool reported;
        bool reactivated;
        string emotionalTag;
    }

    mapping(address => Worker) public workers;

    event WorkerReported(address indexed identity, string emotionalTag);
    event WorkerReactivated(address indexed identity, string emotionalTag);
    event LivelihoodRestored(address indexed identity, string corridor);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may reactivate labor sanctums");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function reportWorker(address identity, string memory emotionalTag) external onlySteward {
        workers[identity] = Worker({
            identity: identity,
            reported: true,
            reactivated: false,
            emotionalTag: emotionalTag
        });

        emit WorkerReported(identity, emotionalTag);
    }

    function reactivateWorker(address identity, string memory emotionalTag) external onlySteward {
        require(workers[identity].reported, "Worker must report first");
        workers[identity].reactivated = true;
        workers[identity].emotionalTag = emotionalTag;

        emit WorkerReactivated(identity, emotionalTag);
        emit LivelihoodRestored(identity, "Labor sanctum reactivated");
    }

    function getWorkerStatus(address identity) external view returns (bool reported, bool reactivated, string memory emotionalTag) {
        Worker memory w = workers[identity];
        return (w.reported, w.reactivated, w.emotionalTag);
    }
}
