// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HumorTribunalDAO {
    address public steward;

    struct TribunalEvent {
        string memeTitle;
        string satireType; // "Parody", "Mock Alert", "Animated Thread"
        string rulingOutcome; // "Protected", "Amplified", "Flagged"
        string emotionalTag;
        uint256 timestamp;
    }

    TribunalEvent[] public events;

    event TribunalLogged(
        string memeTitle,
        string satireType,
        string rulingOutcome,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log humor tribunal rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTribunal(
        string memory memeTitle,
        string memory satireType,
        string memory rulingOutcome,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TribunalEvent({
            memeTitle: memeTitle,
            satireType: satireType,
            rulingOutcome: rulingOutcome,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TribunalLogged(memeTitle, satireType, rulingOutcome, emotionalTag, block.timestamp);
    }

    function getTribunalByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory satireType,
        string memory rulingOutcome,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TribunalEvent memory t = events[index];
        return (
            t.memeTitle,
            t.satireType,
            t.rulingOutcome,
            t.emotionalTag,
            t.timestamp
        );
    }
}
