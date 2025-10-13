// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GeopoliticalSatireRegistryDAO {
    address public steward;

    struct SatireEvent {
        string memeTitle;
        string geopoliticalTrigger; // "Tariff", "Sanction", "Protectionist Bill"
        string satireType; // "Parody", "Mock Speech", "Reaction Thread"
        string emotionalTag;
        uint256 timestamp;
    }

    SatireEvent[] public events;

    event SatireLogged(
        string memeTitle,
        string geopoliticalTrigger,
        string satireType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log geopolitical satire rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSatire(
        string memory memeTitle,
        string memory geopoliticalTrigger,
        string memory satireType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SatireEvent({
            memeTitle: memeTitle,
            geopoliticalTrigger: geopoliticalTrigger,
            satireType: satireType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SatireLogged(memeTitle, geopoliticalTrigger, satireType, emotionalTag, block.timestamp);
    }

    function getSatireByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory geopoliticalTrigger,
        string memory satireType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SatireEvent memory s = events[index];
        return (
            s.memeTitle,
            s.geopoliticalTrigger,
            s.satireType,
            s.emotionalTag,
            s.timestamp
        );
    }
}
