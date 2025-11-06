// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OmbudsmanTaskForceDAO {
    address public steward;

    struct TaskForceEntry {
        string investigationTarget;
        string mandateScope;
        string civicSignal;
        string emotionalTag;
    }

    TaskForceEntry[] public registry;

    event OmbudsmanTaskForceBroadcasted(string investigationTarget, string mandateScope, string civicSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastTaskForce(
        string memory investigationTarget,
        string memory mandateScope,
        string memory civicSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TaskForceEntry(investigationTarget, mandateScope, civicSignal, emotionalTag));
        emit OmbudsmanTaskForceBroadcasted(investigationTarget, mandateScope, civicSignal, emotionalTag);
    }
}
