// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OffsetDignityTribunalDAO {
    address public steward;

    struct TribunalEvent {
        string offsetType; // "Low-Income Super", "Pension Rebate", "Healthcare Subsidy"
        string dignityClause; // "Indexation Guarantee", "Equity Clause", "Transparency Mandate"
        string tribunalVerdict; // "Ratified", "Flagged", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    TribunalEvent[] public events;

    event TribunalLogged(
        string offsetType,
        string dignityClause,
        string tribunalVerdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log offset dignity trials");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTribunal(
        string memory offsetType,
        string memory dignityClause,
        string memory tribunalVerdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TribunalEvent({
            offsetType: offsetType,
            dignityClause: dignityClause,
            tribunalVerdict: tribunalVerdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TribunalLogged(offsetType, dignityClause, tribunalVerdict, emotionalTag, block.timestamp);
    }

    function getTribunalByIndex(uint256 index) external view returns (
        string memory offsetType,
        string memory dignityClause,
        string memory tribunalVerdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TribunalEvent memory t = events[index];
        return (
            t.offsetType,
            t.dignityClause,
            t.tribunalVerdict,
            t.emotionalTag,
            t.timestamp
        );
    }
}
