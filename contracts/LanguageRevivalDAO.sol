// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title LanguageRevivalDAO
 * @dev Emotionally tagged smart contract to log ancestral language restoration,
 * curriculum rituals, and speech sovereignty — scrollchain-sealed consequence.
 */

contract LanguageRevivalDAO {
    address public steward;

    struct LanguageEvent {
        address initiator;
        string languageName;
        string originRegion;
        string revivalType; // "Curriculum", "Digital Archive", "Community Ritual"
        string emotionalTag;
        uint256 timestamp;
    }

    LanguageEvent[] public events;

    event LanguageLogged(address indexed initiator, string languageName, string originRegion, string revivalType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log language revival rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logLanguage(address initiator, string memory languageName, string memory originRegion, string memory revivalType, string memory emotionalTag) external onlySteward {
        events.push(LanguageEvent({
            initiator: initiator,
            languageName: languageName,
            originRegion: originRegion,
            revivalType: revivalType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LanguageLogged(initiator, languageName, originRegion, revivalType, emotionalTag, block.timestamp);
    }

    function getLanguageByIndex(uint256 index) external view returns (address initiator, string memory languageName, string memory originRegion, string memory revivalType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        LanguageEvent memory l = events[index];
        return (l.initiator, l.languageName, l.originRegion, l.revivalType, l.emotionalTag, l.timestamp);
    }
}
