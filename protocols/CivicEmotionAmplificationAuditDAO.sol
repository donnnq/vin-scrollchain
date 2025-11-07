// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicEmotionAmplificationAuditDAO {
    address public steward;

    struct AmplificationEntry {
        string timestamp;
        string mediaSource;
        string emotionType;
        string amplificationMethod;
        string civicImpact;
        string emotionalTag;
    }

    AmplificationEntry[] public registry;

    event EmotionAmplificationAudited(string timestamp, string mediaSource, string emotionType, string amplificationMethod, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditAmplification(
        string memory timestamp,
        string memory mediaSource,
        string memory emotionType,
        string memory amplificationMethod,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AmplificationEntry(timestamp, mediaSource, emotionType, amplificationMethod, civicImpact, emotionalTag));
        emit EmotionAmplificationAudited(timestamp, mediaSource, emotionType, amplificationMethod, civicImpact, emotionalTag);
    }
}
