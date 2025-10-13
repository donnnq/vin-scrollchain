// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PurokShelterEquityProtocolDAO {
    address public steward;

    struct ShelterEvent {
        string purok;
        string shelterType; // "Evacuation Center", "Temporary Housing", "Barracks"
        string equityStatus; // "Overcrowded", "Accessible", "Underserved"
        string emotionalTag;
        uint256 timestamp;
    }

    ShelterEvent[] public events;

    event ShelterLogged(
        string purok,
        string shelterType,
        string equityStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log shelter equity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logShelter(
        string memory purok,
        string memory shelterType,
        string memory equityStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ShelterEvent({
            purok: purok,
            shelterType: shelterType,
            equityStatus: equityStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ShelterLogged(purok, shelterType, equityStatus, emotionalTag, block.timestamp);
    }

    function getShelterByIndex(uint256 index) external view returns (
        string memory purok,
        string memory shelterType,
        string memory equityStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ShelterEvent memory s = events[index];
        return (
            s.purok,
            s.shelterType,
            s.equityStatus,
            s.emotionalTag,
            s.timestamp
        );
    }
}
