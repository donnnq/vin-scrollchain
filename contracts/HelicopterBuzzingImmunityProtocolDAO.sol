// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HelicopterBuzzingImmunityProtocolDAO {
    address public steward;

    struct BuzzingEvent {
        string aircraftTargeted; // "Philippine Navy Plane", "PCG Aircraft"
        string perpetratorNation; // "China"
        string buzzingStatus; // "Flagged", "Documented", "Condemned"
        string emotionalTag;
        uint256 timestamp;
    }

    BuzzingEvent[] public events;

    event BuzzingLogged(
        string aircraftTargeted,
        string perpetratorNation,
        string buzzingStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log helicopter buzzing immunity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBuzzing(
        string memory aircraftTargeted,
        string memory perpetratorNation,
        string memory buzzingStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(BuzzingEvent({
            aircraftTargeted: aircraftTargeted,
            perpetratorNation: perpetratorNation,
            buzzingStatus: buzzingStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BuzzingLogged(aircraftTargeted, perpetratorNation, buzzingStatus, emotionalTag, block.timestamp);
    }
}
