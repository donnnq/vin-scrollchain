// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GenerationCostOverrideProtocolDAO {
    address public steward;

    struct OverrideEvent {
        string powerSource; // "Coal", "Natural Gas", "Solar", "Hydro"
        string overrideTrigger; // "Fuel Price Spike", "Tax Burden", "Plant Shortage"
        string overrideAction; // "Rate Review", "Emergency Subsidy", "Renewable Shift"
        string overrideStatus; // "Deployed", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    OverrideEvent[] public events;

    event OverrideLogged(
        string powerSource,
        string overrideTrigger,
        string overrideAction,
        string overrideStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log generation cost override rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logOverride(
        string memory powerSource,
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(OverrideEvent({
            powerSource: powerSource,
            overrideTrigger: overrideTrigger,
            overrideAction: overrideAction,
            overrideStatus: overrideStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit OverrideLogged(powerSource, overrideTrigger, overrideAction, overrideStatus, emotionalTag, block.timestamp);
    }

    function getOverrideByIndex(uint256 index) external view returns (
        string memory powerSource,
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        OverrideEvent memory o = events[index];
        return (
            o.powerSource,
            o.overrideTrigger,
            o.overrideAction,
            o.overrideStatus,
            o.emotionalTag,
            o.timestamp
        );
    }
}
