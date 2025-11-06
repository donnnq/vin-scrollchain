// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PolicyRiskIndex {
    address public steward;

    struct RiskEntry {
        string region;
        string policyType;
        string riskLevel;
        string emotionalTag;
    }

    RiskEntry[] public index;

    event PolicyRiskTagged(string region, string policyType, string riskLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRisk(
        string memory region,
        string memory policyType,
        string memory riskLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RiskEntry(region, policyType, riskLevel, emotionalTag));
        emit PolicyRiskTagged(region, policyType, riskLevel, emotionalTag);
    }
}
