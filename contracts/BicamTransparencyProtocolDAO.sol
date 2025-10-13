// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BicamTransparencyProtocolDAO {
    address public steward;

    struct TransparencyEvent {
        string chamber; // "Senate", "House", "Joint"
        string transparencyTrigger; // "Budget Bicam", "Confidential Fund", "Last-Minute Insertions"
        string actionTaken; // "Livestreamed", "Opened to Media", "Flagged"
        string status; // "Deployed", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    TransparencyEvent[] public events;

    event TransparencyLogged(
        string chamber,
        string transparencyTrigger,
        string actionTaken,
        string status,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log bicam transparency rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTransparency(
        string memory chamber,
        string memory transparencyTrigger,
        string memory actionTaken,
        string memory status,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TransparencyEvent({
            chamber: chamber,
            transparencyTrigger: transparencyTrigger,
            actionTaken: actionTaken,
            status: status,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TransparencyLogged(chamber, transparencyTrigger, actionTaken, status, emotionalTag, block.timestamp);
    }

    function getTransparencyByIndex(uint256 index) external view returns (
        string memory chamber,
        string memory transparencyTrigger,
        string memory actionTaken,
        string memory status,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TransparencyEvent memory t = events[index];
        return (
            t.chamber,
            t.transparencyTrigger,
            t.actionTaken,
            t.status,
            t.emotionalTag,
            t.timestamp
        );
    }
}
