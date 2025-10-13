// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BicamLivestreamOverrideProtocolDAO {
    address public steward;

    struct OverrideEvent {
        string chamber; // "Senate", "House", "Joint"
        string overrideTrigger; // "Blocked Livestream", "Media Ban", "Closed-Door Session"
        string overrideAction; // "Forced Livestream", "Public Archive", "Civil Society Entry"
        string overrideStatus; // "Deployed", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    OverrideEvent[] public events;

    event OverrideLogged(
        string chamber,
        string overrideTrigger,
        string overrideAction,
        string overrideStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log bicam livestream override rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logOverride(
        string memory chamber,
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(OverrideEvent({
            chamber: chamber,
            overrideTrigger: overrideTrigger,
            overrideAction: overrideAction,
            overrideStatus: overrideStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit OverrideLogged(chamber, overrideTrigger, overrideAction, overrideStatus, emotionalTag, block.timestamp);
    }

    function getOverrideByIndex(uint256 index) external view returns (
        string memory chamber,
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        OverrideEvent memory o = events[index];
        return (
            o.chamber,
            o.overrideTrigger,
            o.overrideAction,
            o.overrideStatus,
            o.emotionalTag,
            o.timestamp
        );
    }
}
