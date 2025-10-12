// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DeportedWorkerReturnSanctumDAO
 * @dev Emotionally tagged smart contract to authorize the return of deported workers
 * through a special lane protocol: no fees, no punishment, just dignity and restoration.
 */

contract DeportedWorkerReturnSanctumDAO {
    address public steward;

    struct Worker {
        address identity;
        bool registered;
        bool returned;
        string emotionalTag;
    }

    mapping(address => Worker) public workers;

    event WorkerRegistered(address indexed identity, string emotionalTag);
    event WorkerReturned(address indexed identity, string emotionalTag);
    event SanctumRestored(address indexed identity, string corridor);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may authorize sanctum return");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerDeportedWorker(address identity, string memory emotionalTag) external onlySteward {
        workers[identity] = Worker({
            identity: identity,
            registered: true,
            returned: false,
            emotionalTag: emotionalTag
        });

        emit WorkerRegistered(identity, emotionalTag);
    }

    function authorizeReturn(address identity, string memory emotionalTag) external onlySteward {
        require(workers[identity].registered, "Worker not registered in sanctum");
        workers[identity].returned = true;
        workers[identity].emotionalTag = emotionalTag;

        emit WorkerReturned(identity, emotionalTag);
        emit SanctumRestored(identity, "Labor corridor reentry");
    }

    function getWorkerStatus(address identity) external view returns (bool registered, bool returned, string memory emotionalTag) {
        Worker memory w = workers[identity];
        return (w.registered, w.returned, w.emotionalTag);
    }
}
