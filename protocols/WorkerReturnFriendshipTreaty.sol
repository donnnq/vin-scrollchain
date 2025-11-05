// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerReturnFriendshipTreaty {
    address public steward;

    struct ReturnClause {
        string companyName;
        string workerName;
        string reentryProtocol;
        string emotionalTag;
    }

    ReturnClause[] public treatyLog;

    event WorkerReturnTagged(string companyName, string workerName, string reentryProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReturn(
        string memory companyName,
        string memory workerName,
        string memory reentryProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ReturnClause(companyName, workerName, reentryProtocol, emotionalTag));
        emit WorkerReturnTagged(companyName, workerName, reentryProtocol, emotionalTag);
    }
}
