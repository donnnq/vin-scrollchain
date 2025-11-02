// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract XenophobicPolicyDriftCodex {
    address public steward;

    struct DriftEntry {
        string policyName;
        string exclusionTarget;
        string driftTrigger;
        string emotionalTag;
    }

    DriftEntry[] public codex;

    event XenophobicPolicyDriftLogged(string policyName, string exclusionTarget, string driftTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logPolicyDrift(
        string memory policyName,
        string memory exclusionTarget,
        string memory driftTrigger,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DriftEntry(policyName, exclusionTarget, driftTrigger, emotionalTag));
        emit XenophobicPolicyDriftLogged(policyName, exclusionTarget, driftTrigger, emotionalTag);
    }
}
