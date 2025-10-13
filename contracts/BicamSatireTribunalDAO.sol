// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BicamSatireTribunalDAO {
    address public steward;

    struct TribunalEvent {
        string chamber; // "Senate", "House", "Joint"
        string satireTrigger; // "Confidential Fund", "Last-Minute Insertions", "Budget Flip-Flop"
        string satireType; // "Mock Livestream", "Animated Thread", "Parody PSA"
        string verdict; // "Flagged", "Amplified", "Exempted"
        string emotionalTag;
        uint256 timestamp;
    }

    TribunalEvent[] public events;

    event TribunalLogged(
        string chamber,
        string satireTrigger,
        string satireType,
        string verdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log bicam satire trials");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTribunal(
        string memory chamber,
        string memory satireTrigger,
        string memory satireType,
        string memory verdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TribunalEvent({
            chamber: chamber,
            satireTrigger: satireTrigger,
            satireType: satireType,
            verdict: verdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TribunalLogged(chamber, satireTrigger, satireType, verdict, emotionalTag, block.timestamp);
    }

    function getTribunalByIndex(uint256 index) external view returns (
        string memory chamber,
        string memory satireTrigger,
        string memory satireType,
        string memory verdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TribunalEvent memory t = events[index];
        return (
            t.chamber,
            t.satireTrigger,
            t.satireType,
            t.verdict,
            t.emotionalTag,
            t.timestamp
        );
    }
}
