// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MountainInfrastructureFloodRiskCodex {
    address public steward;

    struct RiskClause {
        string projectName;
        string terrainType;
        string hydrologicalImpact;
        string vegetationLossSignal;
        string emotionalTag;
    }

    RiskClause[] public codex;

    event MountainFloodRiskTagged(string projectName, string terrainType, string hydrologicalImpact, string vegetationLossSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFloodRisk(
        string memory projectName,
        string memory terrainType,
        string memory hydrologicalImpact,
        string memory vegetationLossSignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RiskClause(projectName, terrainType, hydrologicalImpact, vegetationLossSignal, emotionalTag));
        emit MountainFloodRiskTagged(projectName, terrainType, hydrologicalImpact, vegetationLossSignal, emotionalTag);
    }
}
