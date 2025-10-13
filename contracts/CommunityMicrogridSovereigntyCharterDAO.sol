// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunityMicrogridSovereigntyCharterDAO {
    address public steward;

    struct CharterEvent {
        string communityName;
        string sovereigntyClause; // "Ownership", "Rate Control", "Disaster Resilience"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    CharterEvent[] public events;

    event CharterLogged(
        string communityName,
        string sovereigntyClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log microgrid sovereignty treaties");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCharter(
        string memory communityName,
        string memory sovereigntyClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CharterEvent({
            communityName: communityName,
            sovereigntyClause: sovereigntyClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CharterLogged(communityName, sovereigntyClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getCharterByIndex(uint256 index) external view returns (
        string memory communityName,
        string memory sovereigntyClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CharterEvent memory c = events[index];
        return (
            c.communityName,
            c.sovereigntyClause,
            c.clauseStatus,
            c.emotionalTag,
            c.timestamp
        );
    }
}
