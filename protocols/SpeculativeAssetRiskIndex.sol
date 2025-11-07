// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpeculativeAssetRiskIndex {
    address public steward;

    struct RiskEntry {
        string asset;
        uint256 riskScore;
        string timestamp;
        string volatilityTrigger;
        string emotionalTag;
    }

    RiskEntry[] public index;

    event SpeculativeRiskLogged(string asset, uint256 riskScore, string timestamp, string volatilityTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRisk(
        string memory asset,
        uint256 riskScore,
        string memory timestamp,
        string memory volatilityTrigger,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RiskEntry(asset, riskScore, timestamp, volatilityTrigger, emotionalTag));
        emit SpeculativeRiskLogged(asset, riskScore, timestamp, volatilityTrigger, emotionalTag);
    }
}
