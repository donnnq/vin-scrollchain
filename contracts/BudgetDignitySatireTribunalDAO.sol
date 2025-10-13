// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetDignitySatireTribunalDAO {
    address public steward;

    struct TribunalEvent {
        string satireTitle;
        string budgetTrigger; // "Confidential Fund", "Offset Drift", "Bracket Freeze"
        string satireType; // "Mock Livestream", "Animated Thread", "Parody PSA"
        string tribunalVerdict; // "Amplified", "Flagged", "Exempted"
        string emotionalTag;
        uint256 timestamp;
    }

    TribunalEvent[] public events;

    event TribunalLogged(
        string satireTitle,
        string budgetTrigger,
        string satireType,
        string tribunalVerdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log budget dignity satire trials");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTribunal(
        string memory satireTitle,
        string memory budgetTrigger,
        string memory satireType,
        string memory tribunalVerdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TribunalEvent({
            satireTitle: satireTitle,
            budgetTrigger: budgetTrigger,
            satireType: satireType,
            tribunalVerdict: tribunalVerdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TribunalLogged(satireTitle, budgetTrigger, satireType, tribunalVerdict, emotionalTag, block.timestamp);
    }

    function getTribunalByIndex(uint256 index) external view returns (
        string memory satireTitle,
        string memory budgetTrigger,
        string memory satireType,
        string memory tribunalVerdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TribunalEvent memory t = events[index];
        return (
            t.satireTitle,
            t.budgetTrigger,
            t.satireType,
            t.tribunalVerdict,
            t.emotionalTag,
            t.timestamp
        );
    }
}
