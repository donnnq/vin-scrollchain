// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HumorImmunityCyberWarfareDAO {
    address public steward;

    struct ImmunityEvent {
        string memeTitle;
        string cyberThreatReference;
        string humorType; // "Satire", "Parody", "Reaction Thread"
        string immunityStatus; // "Protected", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    ImmunityEvent[] public events;

    event ImmunityLogged(
        string memeTitle,
        string cyberThreatReference,
        string humorType,
        string immunityStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log humor immunity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logImmunity(
        string memory memeTitle,
        string memory cyberThreatReference,
        string memory humorType,
        string memory immunityStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ImmunityEvent({
            memeTitle: memeTitle,
            cyberThreatReference: cyberThreatReference,
            humorType: humorType,
            immunityStatus: immunityStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ImmunityLogged(memeTitle, cyberThreatReference, humorType, immunityStatus, emotionalTag, block.timestamp);
    }

    function getImmunityByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory cyberThreatReference,
        string memory humorType,
        string memory immunityStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ImmunityEvent memory i = events[index];
        return (
            i.memeTitle,
            i.cyberThreatReference,
            i.humorType,
            i.immunityStatus,
            i.emotionalTag,
            i.timestamp
        );
    }
}
