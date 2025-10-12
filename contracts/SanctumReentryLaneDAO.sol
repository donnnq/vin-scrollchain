// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SanctumReentryLaneDAO
 * @dev Emotionally tagged smart contract to authorize the return of deported workers
 * via a special reentry lane — no fees, no penalties, just report and restore.
 */

contract SanctumReentryLaneDAO {
    address public steward;

    struct Worker {
        address identity;
        bool registered;
        bool cleared;
        bool restored;
        string emotionalTag;
    }

    mapping(address => Worker) public workers;

    event WorkerRegistered(address indexed identity, string emotionalTag);
    event WorkerCleared(address indexed identity, string emotionalTag);
    event WorkerRestored(address indexed identity, string emotionalTag);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may authorize sanctum reentry");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerWorker(address identity, string memory emotionalTag) external onlySteward {
        workers[identity] = Worker({
            identity: identity,
            registered: true,
            cleared: false,
            restored: false,
            emotionalTag: emotionalTag
        });

        emit WorkerRegistered(identity, emotionalTag);
    }

    function reportAndClear(address identity, string memory emotionalTag) external onlySteward {
        require(workers[identity].registered, "Worker not registered in sanctum");
        workers[identity].cleared = true;
        workers[identity].emotionalTag = emotionalTag;

        emit WorkerCleared(identity, emotionalTag);
    }

    function restoreWorker(address identity, string memory emotionalTag) external onlySteward {
        require(workers[identity].cleared, "Worker must be cleared first");
        workers[identity].restored = true;
        workers[identity].emotionalTag = emotionalTag;

        emit WorkerRestored(identity, emotionalTag);
    }

    function getWorkerStatus(address identity) external view returns (bool registered, bool cleared, bool restored, string memory emotionalTag) {
        Worker memory w = workers[identity];
        return (w.registered, w.cleared, w.restored, w.emotionalTag);
    }
}
