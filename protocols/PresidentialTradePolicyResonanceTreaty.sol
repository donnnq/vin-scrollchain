// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresidentialTradePolicyResonanceTreaty {
    address public steward;

    struct PolicyEntry {
        string presidentName;
        string tradePolicy;
        string globalImpact;
        string emotionalTag;
    }

    PolicyEntry[] public treaty;

    event TradePolicyResonanceTagged(string presidentName, string tradePolicy, string globalImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPolicyResonance(
        string memory presidentName,
        string memory tradePolicy,
        string memory globalImpact,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(PolicyEntry(presidentName, tradePolicy, globalImpact, emotionalTag));
        emit TradePolicyResonanceTagged(presidentName, tradePolicy, globalImpact, emotionalTag);
    }
}
