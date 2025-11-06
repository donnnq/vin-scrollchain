// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemorialWorkerDignityTreaty {
    address public steward;

    struct DignityEntry {
        string workerRole;
        string emotionalLaborType;
        string dignityProtocol;
        string emotionalTag;
    }

    DignityEntry[] public treaty;

    event MemorialWorkerTagged(string workerRole, string emotionalLaborType, string dignityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWorker(
        string memory workerRole,
        string memory emotionalLaborType,
        string memory dignityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(DignityEntry(workerRole, emotionalLaborType, dignityProtocol, emotionalTag));
        emit MemorialWorkerTagged(workerRole, emotionalLaborType, dignityProtocol, emotionalTag);
    }
}
