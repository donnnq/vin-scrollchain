// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetLivestreamSovereigntyCharterDAO {
    address public steward;

    struct LivestreamEvent {
        string committeeName;
        string budgetTopic; // "Confidential Funds", "Line-Item Insertions", "Realignments"
        string livestreamStatus; // "Live", "Blocked", "Archived"
        string emotionalTag;
        uint256 timestamp;
    }

    LivestreamEvent[] public events;

    event LivestreamLogged(
        string committeeName,
        string budgetTopic,
        string livestreamStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log budget livestream rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logLivestream(
        string memory committeeName,
        string memory budgetTopic,
        string memory livestreamStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(LivestreamEvent({
            committeeName: committeeName,
            budgetTopic: budgetTopic,
            livestreamStatus: livestreamStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LivestreamLogged(committeeName, budgetTopic, livestreamStatus, emotionalTag, block.timestamp);
    }

    function getLivestreamByIndex(uint256 index) external view returns (
        string memory committeeName,
        string memory budgetTopic,
        string memory livestreamStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        LivestreamEvent memory l = events[index];
        return (
            l.committeeName,
            l.budgetTopic,
            l.livestreamStatus,
            l.emotionalTag,
            l.timestamp
        );
    }
}
