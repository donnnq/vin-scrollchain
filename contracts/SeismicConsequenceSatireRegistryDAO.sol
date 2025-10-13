// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SeismicConsequenceSatireRegistryDAO {
    address public steward;

    struct SatireEvent {
        string memeTitle;
        string quakeReference;
        string satireType; // "Parody", "Mock Alert", "Reaction Meme"
        string emotionalTag;
        uint256 timestamp;
    }

    SatireEvent[] public events;

    event SatireLogged(
        string memeTitle,
        string quakeReference,
        string satireType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log seismic satire rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSatire(
        string memory memeTitle,
        string memory quakeReference,
        string memory satireType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SatireEvent({
            memeTitle: memeTitle,
            quakeReference: quakeReference,
            satireType: satireType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SatireLogged(memeTitle, quakeReference, satireType, emotionalTag, block.timestamp);
    }

    function getSatireByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory quakeReference,
        string memory satireType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SatireEvent memory s = events[index];
        return (
            s.memeTitle,
            s.quakeReference,
            s.satireType,
            s.emotionalTag,
            s.timestamp
        );
    }
}
