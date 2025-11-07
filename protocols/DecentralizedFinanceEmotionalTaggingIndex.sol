// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedFinanceEmotionalTaggingIndex {
    address public steward;

    struct TagEntry {
        string protocolName;
        string timestamp;
        string eventType;
        string emotionalTag;
        string communitySentiment;
    }

    TagEntry[] public index;

    event EmotionalTagIndexed(string protocolName, string timestamp, string eventType, string emotionalTag, string communitySentiment);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexTag(
        string memory protocolName,
        string memory timestamp,
        string memory eventType,
        string memory emotionalTag,
        string memory communitySentiment
    ) public onlySteward {
        index.push(TagEntry(protocolName, timestamp, eventType, emotionalTag, communitySentiment));
        emit EmotionalTagIndexed(protocolName, timestamp, eventType, emotionalTag, communitySentiment);
    }
}
