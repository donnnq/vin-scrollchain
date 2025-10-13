// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PurokCrisisWageDAO {
    address public steward;

    struct WageEvent {
        string purokName;
        string frontlineGroup; // "Health Workers", "Tanods", "Sanitation Crew"
        uint256 wageIssued;
        string crisisTrigger; // "Flood", "Fire", "Evacuation"
        string emotionalTag;
        uint256 timestamp;
    }

    WageEvent[] public events;

    event WageLogged(
        string purokName,
        string frontlineGroup,
        uint256 wageIssued,
        string crisisTrigger,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log purok wage rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logWage(
        string memory purokName,
        string memory frontlineGroup,
        uint256 wageIssued,
        string memory crisisTrigger,
        string memory emotionalTag
    ) external onlySteward {
        events.push(WageEvent({
            purokName: purokName,
            frontlineGroup: frontlineGroup,
            wageIssued: wageIssued,
            crisisTrigger: crisisTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit WageLogged(purokName, frontlineGroup, wageIssued, crisisTrigger, emotionalTag, block.timestamp);
    }

    function getWageByIndex(uint256 index) external view returns (
        string memory purokName,
        string memory frontlineGroup,
        uint256 wageIssued,
        string memory crisisTrigger,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        WageEvent memory w = events[index];
        return (
            w.purokName,
            w.frontlineGroup,
            w.wageIssued,
            w.crisisTrigger,
            w.emotionalTag,
            w.timestamp
        );
    }
}
