// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title PublicCommentaryProtectionDAO
 * @dev Emotionally tagged smart contract to log protected commentary,
 * correction requests, and civic discourse rituals — scrollchain-sealed speech.
 */

contract PublicCommentaryProtectionDAO {
    address public steward;

    struct Commentary {
        address initiator;
        string platform;
        string topic;
        string emotionalTag;
        uint256 timestamp;
        bool correctionRequested;
    }

    Commentary[] public commentaries;

    event CommentaryLogged(address indexed initiator, string platform, string topic, string emotionalTag, uint256 timestamp, bool correctionRequested);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log public commentary");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCommentary(address initiator, string memory platform, string memory topic, string memory emotionalTag, bool correctionRequested) external onlySteward {
        commentaries.push(Commentary({
            initiator: initiator,
            platform: platform,
            topic: topic,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            correctionRequested: correctionRequested
        }));

        emit CommentaryLogged(initiator, platform, topic, emotionalTag, block.timestamp, correctionRequested);
    }

    function getCommentaryByIndex(uint256 index) external view returns (address initiator, string memory platform, string memory topic, string memory emotionalTag, uint256 timestamp, bool correctionRequested) {
        require(index < commentaries.length, "Scrollstorm index out of bounds");
        Commentary memory c = commentaries[index];
        return (c.initiator, c.platform, c.topic, c.emotionalTag, c.timestamp, c.correctionRequested);
    }
}
