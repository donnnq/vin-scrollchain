// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BicamOverrideLivestreamDAO {
    address public steward;

    struct LivestreamEvent {
        string overrideTrigger; // "Blocked Livestream", "Media Ban", "Closed-Door Session"
        string overrideAction; // "Forced Livestream", "Public Archive", "Civil Society Entry"
        string overrideStatus; // "Deployed", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    LivestreamEvent[] public events;

    event LivestreamLogged(
        string overrideTrigger,
        string overrideAction,
        string overrideStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log bicam override livestream rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logLivestream(
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(LivestreamEvent({
            overrideTrigger: overrideTrigger,
            overrideAction: overrideAction,
            overrideStatus: overrideStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LivestreamLogged(overrideTrigger, overrideAction, overrideStatus, emotionalTag, block.timestamp);
    }

    function getLivestreamByIndex(uint256 index) external view returns (
        string memory overrideTrigger,
        string memory overrideAction,
        string memory overrideStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        LivestreamEvent memory l = events[index];
        return (
            l.overrideTrigger,
            l.overrideAction,
            l.overrideStatus,
            l.emotionalTag,
            l.timestamp
        );
    }
}
