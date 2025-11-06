// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SocialismSentimentDAO {
    address public steward;

    struct SentimentEntry {
        string region;
        string policyType;
        string publicSentiment;
        string emotionalTag;
    }

    SentimentEntry[] public registry;

    event SocialismSentimentTagged(string region, string policyType, string publicSentiment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSentiment(
        string memory region,
        string memory policyType,
        string memory publicSentiment,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SentimentEntry(region, policyType, publicSentiment, emotionalTag));
        emit SocialismSentimentTagged(region, policyType, publicSentiment, emotionalTag);
    }
}
