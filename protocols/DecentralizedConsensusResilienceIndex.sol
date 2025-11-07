// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedConsensusResilienceIndex {
    address public steward;

    struct ResilienceEntry {
        string protocolName;
        string timestamp;
        uint256 trustScore;
        uint256 forkRiskLevel;
        string volatilityAssessment;
        string emotionalTag;
    }

    ResilienceEntry[] public index;

    event ConsensusResilienceLogged(string protocolName, string timestamp, uint256 trustScore, uint256 forkRiskLevel, string volatilityAssessment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logResilience(
        string memory protocolName,
        string memory timestamp,
        uint256 trustScore,
        uint256 forkRiskLevel,
        string memory volatilityAssessment,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResilienceEntry(protocolName, timestamp, trustScore, forkRiskLevel, volatilityAssessment, emotionalTag));
        emit ConsensusResilienceLogged(protocolName, timestamp, trustScore, forkRiskLevel, volatilityAssessment, emotionalTag);
    }
}
