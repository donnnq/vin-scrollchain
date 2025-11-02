// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PolicyDeEscalationCodex {
    address public steward;

    struct DeEscalationEntry {
        string policyName;
        string escalationTrigger;
        string remedyAction;
        string emotionalTag;
    }

    DeEscalationEntry[] public codex;

    event PolicyDeEscalationLogged(string policyName, string escalationTrigger, string remedyAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDeEscalation(
        string memory policyName,
        string memory escalationTrigger,
        string memory remedyAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DeEscalationEntry(policyName, escalationTrigger, remedyAction, emotionalTag));
        emit PolicyDeEscalationLogged(policyName, escalationTrigger, remedyAction, emotionalTag);
    }
}
