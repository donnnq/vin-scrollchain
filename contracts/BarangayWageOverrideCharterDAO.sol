// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayWageOverrideCharterDAO {
    address public steward;

    struct OverrideEvent {
        string barangayName;
        string frontlineGroup; // "Health Workers", "Tanods", "Sanitation Crew"
        uint256 wageAdjustment;
        string overrideTrigger; // "Delayed Pay", "Budget Cut", "Crisis Surge"
        string emotionalTag;
        uint256 timestamp;
    }

    OverrideEvent[] public events;

    event OverrideLogged(
        string barangayName,
        string frontlineGroup,
        uint256 wageAdjustment,
        string overrideTrigger,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log barangay wage override rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logOverride(
        string memory barangayName,
        string memory frontlineGroup,
        uint256 wageAdjustment,
        string memory overrideTrigger,
        string memory emotionalTag
    ) external onlySteward {
        events.push(OverrideEvent({
            barangayName: barangayName,
            frontlineGroup: frontlineGroup,
            wageAdjustment: wageAdjustment,
            overrideTrigger: overrideTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit OverrideLogged(barangayName, frontlineGroup, wageAdjustment, overrideTrigger, emotionalTag, block.timestamp);
    }

    function getOverrideByIndex(uint256 index) external view returns (
        string memory barangayName,
        string memory frontlineGroup,
        uint256 wageAdjustment,
        string memory overrideTrigger,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        OverrideEvent memory o = events[index];
        return (
            o.barangayName,
            o.frontlineGroup,
            o.wageAdjustment,
            o.overrideTrigger,
            o.emotionalTag,
            o.timestamp
        );
    }
}
