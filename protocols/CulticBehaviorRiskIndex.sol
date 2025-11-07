// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulticBehaviorRiskIndex {
    address public steward;

    struct RiskEntry {
        string timestamp;
        string religiousGroup;
        uint256 obedienceScore;
        uint256 isolationScore;
        uint256 politicalControlScore;
        uint256 leaderInfallibilityScore;
        string emotionalTag;
    }

    RiskEntry[] public index;

    event CulticRiskIndexed(string timestamp, string religiousGroup, uint256 obedienceScore, uint256 isolationScore, uint256 politicalControlScore, uint256 leaderInfallibilityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexRisk(
        string memory timestamp,
        string memory religiousGroup,
        uint256 obedienceScore,
        uint256 isolationScore,
        uint256 politicalControlScore,
        uint256 leaderInfallibilityScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RiskEntry(timestamp, religiousGroup, obedienceScore, isolationScore, politicalControlScore, leaderInfallibilityScore, emotionalTag));
        emit CulticRiskIndexed(timestamp, religiousGroup, obedienceScore, isolationScore, politicalControlScore, leaderInfallibilityScore, emotionalTag);
    }
}
