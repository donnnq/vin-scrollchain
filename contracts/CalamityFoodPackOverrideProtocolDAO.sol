// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CalamityFoodPackOverrideProtocolDAO {
    address public steward;

    struct OverrideEvent {
        string calamityType; // "Flood", "Fire", "Evacuation"
        string overrideTrigger; // "Spoiled Goods", "Delayed Distribution", "Missing Inventory"
        string overrideAction; // "Emergency Repack", "Mock Alert", "Parody Hotline"
        string overrideStatus; // "Deployed", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    OverrideEvent[] public events;

    event OverrideLogged(
        string calamityType,
        string overrideTrigger,
        string overrideAction,
        string overrideStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log food pack override rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logOverride(
        string memory calamityType,
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(OverrideEvent({
            calamityType: calamityType,
            overrideTrigger: overrideTrigger,
            overrideAction: overrideAction,
            overrideStatus: overrideStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit OverrideLogged(calamityType, overrideTrigger, overrideAction, overrideStatus, emotionalTag, block.timestamp);
    }

    function getOverrideByIndex(uint256 index) external view returns (
        string memory calamityType,
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        OverrideEvent memory o = events[index];
        return (
            o.calamityType,
            o.overrideTrigger,
            o.overrideAction,
            o.overrideStatus,
            o.emotionalTag,
            o.timestamp
        );
    }
}
