 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerProtectionEquityTreaty {
    address public steward;

    struct ProtectionClause {
        string workerName;
        string protectionType;
        string employerName;
        string emotionalTag;
    }

    ProtectionClause[] public treatyLog;

    event WorkerProtectionTagged(string workerName, string protectionType, string employerName, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWorkerProtection(
        string memory workerName,
        string memory protectionType,
        string memory employerName,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ProtectionClause(workerName, protectionType, employerName, emotionalTag));
        emit WorkerProtectionTagged(workerName, protectionType, employerName, emotionalTag);
    }
}
