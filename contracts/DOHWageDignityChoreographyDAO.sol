// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DOHWageDignityChoreographyDAO {
    address public steward;

    struct ChoreographyEvent {
        string healthFacility;
        string frontlineGroup; // "Nurses", "Doctors", "Barangay Health Workers"
        uint256 wageAdjustment;
        string dignityTrigger; // "Delayed Pay", "Budget Cut", "Crisis Surge"
        string emotionalTag;
        uint256 timestamp;
    }

    ChoreographyEvent[] public events;

    event ChoreographyLogged(
        string healthFacility,
        string frontlineGroup,
        uint256 wageAdjustment,
        string dignityTrigger,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log DOH wage dignity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logChoreography(
        string memory healthFacility,
        string memory frontlineGroup,
        uint256 wageAdjustment,
        string memory dignityTrigger,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ChoreographyEvent({
            healthFacility: healthFacility,
            frontlineGroup: frontlineGroup,
            wageAdjustment: wageAdjustment,
            dignityTrigger: dignityTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ChoreographyLogged(healthFacility, frontlineGroup, wageAdjustment, dignityTrigger, emotionalTag, block.timestamp);
    }

    function getChoreographyByIndex(uint256 index) external view returns (
        string memory healthFacility,
        string memory frontlineGroup,
        uint256 wageAdjustment,
        string memory dignityTrigger,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ChoreographyEvent memory c = events[index];
        return (
            c.healthFacility,
            c.frontlineGroup,
            c.wageAdjustment,
            c.dignityTrigger,
            c.emotionalTag,
            c.timestamp
        );
    }
}
