// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LGUYouthWageDignityTribunalDAO {
    address public steward;

    struct TribunalEvent {
        string LGUName;
        string youthGroup; // "Student Volunteers", "Youth Health Workers", "Sanctum Stewards"
        string dignityClause; // "Minimum Wage", "Hazard Bonus", "Mental Health Leave"
        string tribunalVerdict; // "Ratified", "Flagged", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    TribunalEvent[] public events;

    event TribunalLogged(
        string LGUName,
        string youthGroup,
        string dignityClause,
        string tribunalVerdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log youth wage dignity trials");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTribunal(
        string memory LGUName,
        string memory youthGroup,
        string memory dignityClause,
        string memory tribunalVerdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TribunalEvent({
            LGUName: LGUName,
            youthGroup: youthGroup,
            dignityClause: dignityClause,
            tribunalVerdict: tribunalVerdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TribunalLogged(LGUName, youthGroup, dignityClause, tribunalVerdict, emotionalTag, block.timestamp);
    }

    function getTribunalByIndex(uint256 index) external view returns (
        string memory LGUName,
        string memory youthGroup,
        string memory dignityClause,
        string memory tribunalVerdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TribunalEvent memory t = events[index];
        return (
            t.LGUName,
            t.youthGroup,
            t.dignityClause,
            t.tribunalVerdict,
            t.emotionalTag,
            t.timestamp
        );
    }
}
