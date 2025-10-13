// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProtectionistSatireImmunityRegistryDAO {
    address public steward;

    struct SatireEvent {
        string memeTitle;
        string policyReference; // "Keep Call Centers in America Act"
        string satireType; // "Parody", "Mock Speech", "Reaction Thread"
        string immunityLevel; // "Protected", "Flagged", "Open"
        string emotionalTag;
        uint256 timestamp;
    }

    SatireEvent[] public events;

    event SatireLogged(
        string memeTitle,
        string policyReference,
        string satireType,
        string immunityLevel,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log satire immunity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSatire(
        string memory memeTitle,
        string memory policyReference,
        string memory satireType,
        string memory immunityLevel,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SatireEvent({
            memeTitle: memeTitle,
            policyReference: policyReference,
            satireType: satireType,
            immunityLevel: immunityLevel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SatireLogged(memeTitle, policyReference, satireType, immunityLevel, emotionalTag, block.timestamp);
    }

    function getSatireByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory policyReference,
        string memory satireType,
        string memory immunityLevel,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SatireEvent memory s = events[index];
        return (
            s.memeTitle,
            s.policyReference,
            s.satireType,
            s.immunityLevel,
            s.emotionalTag,
            s.timestamp
        );
    }
}
