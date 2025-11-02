// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthVotingDAO {
    address public steward;

    struct YouthEntry {
        string ageGroup;
        string engagementBarrier;
        string mobilizationStrategy;
        string emotionalTag;
    }

    YouthEntry[] public registry;

    event YouthVotingTagged(string ageGroup, string engagementBarrier, string mobilizationStrategy, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagYouthVote(
        string memory ageGroup,
        string memory engagementBarrier,
        string memory mobilizationStrategy,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(YouthEntry(ageGroup, engagementBarrier, mobilizationStrategy, emotionalTag));
        emit YouthVotingTagged(ageGroup, engagementBarrier, mobilizationStrategy, emotionalTag);
    }
}
