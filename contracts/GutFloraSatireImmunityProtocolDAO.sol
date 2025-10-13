// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GutFloraSatireImmunityProtocolDAO {
    address public steward;

    struct ImmunityEvent {
        string microbeName;
        string satireType; // "Meme", "Mock Ad", "Parody Label"
        string originCulture;
        string immunityLevel; // "Protected", "Open", "Flagged"
        string emotionalTag;
        uint256 timestamp;
    }

    ImmunityEvent[] public events;

    event ImmunityLogged(
        string microbeName,
        string satireType,
        string originCulture,
        string immunityLevel,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log gut flora satire immunity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logImmunity(
        string memory microbeName,
        string memory satireType,
        string memory originCulture,
        string memory immunityLevel,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ImmunityEvent({
            microbeName: microbeName,
            satireType: satireType,
            originCulture: originCulture,
            immunityLevel: immunityLevel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ImmunityLogged(microbeName, satireType, originCulture, immunityLevel, emotionalTag, block.timestamp);
    }

    function getImmunityByIndex(uint256 index) external view returns (
        string memory microbeName,
        string memory satireType,
        string memory originCulture,
        string memory immunityLevel,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ImmunityEvent memory i = events[index];
        return (
            i.microbeName,
            i.satireType,
            i.originCulture,
            i.immunityLevel,
            i.emotionalTag,
            i.timestamp
        );
    }
}
