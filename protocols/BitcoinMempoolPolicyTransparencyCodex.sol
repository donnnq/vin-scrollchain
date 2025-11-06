// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitcoinMempoolPolicyTransparencyCodex {
    address public steward;

    struct PolicyEntry {
        string nodeVersion;
        string policyChange;
        string relayImpact;
        string emotionalTag;
    }

    PolicyEntry[] public codex;

    event MempoolPolicyTagged(string nodeVersion, string policyChange, string relayImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPolicy(
        string memory nodeVersion,
        string memory policyChange,
        string memory relayImpact,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(PolicyEntry(nodeVersion, policyChange, relayImpact, emotionalTag));
        emit MempoolPolicyTagged(nodeVersion, policyChange, relayImpact, emotionalTag);
    }
}
