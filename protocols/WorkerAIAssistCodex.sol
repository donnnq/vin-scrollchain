// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerAIAssistCodex {
    address public steward;

    struct AssistEntry {
        string systemName;
        string assistFunction;
        string workerBenefit;
        string emotionalTag;
    }

    AssistEntry[] public codex;

    event WorkerAIAssistLogged(string systemName, string assistFunction, string workerBenefit, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logWorkerAssist(
        string memory systemName,
        string memory assistFunction,
        string memory workerBenefit,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AssistEntry(systemName, assistFunction, workerBenefit, emotionalTag));
        emit WorkerAIAssistLogged(systemName, assistFunction, workerBenefit, emotionalTag);
    }
}
