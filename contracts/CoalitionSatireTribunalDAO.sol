// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CoalitionSatireTribunalDAO {
    address public steward;

    struct TribunalEvent {
        string satireTitle;
        string coalitionTrigger; // "Policy Flip-Flop", "Transparency Drift", "Offset Reversal"
        string satireType; // "Mock Debate", "Animated Thread", "Parody PSA"
        string tribunalVerdict; // "Amplified", "Flagged", "Exempted"
        string emotionalTag;
        uint256 timestamp;
    }

    TribunalEvent[] public events;

    event TribunalLogged(
        string satireTitle,
        string coalitionTrigger,
        string satireType,
        string tribunalVerdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log coalition satire trials");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTribunal(
        string memory satireTitle,
        string memory coalitionTrigger,
        string memory satireType,
        string memory tribunalVerdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TribunalEvent({
            satireTitle: satireTitle,
            coalitionTrigger: coalitionTrigger,
            satireType: satireType,
            tribunalVerdict: tribunalVerdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TribunalLogged(satireTitle, coalitionTrigger, satireType, tribunalVerdict, emotionalTag, block.timestamp);
    }

    function getTribunalByIndex(uint256 index) external view returns (
        string memory satireTitle,
        string memory coalitionTrigger,
        string memory satireType,
        string memory tribunalVerdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TribunalEvent memory t = events[index];
        return (
            t.satireTitle,
            t.coalitionTrigger,
            t.satireType,
            t.tribunalVerdict,
            t.emotionalTag,
            t.timestamp
        );
    }
}
