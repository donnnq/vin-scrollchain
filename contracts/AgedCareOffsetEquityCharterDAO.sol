// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AgedCareOffsetEquityCharterDAO {
    address public steward;

    struct CharterEvent {
        string offsetType; // "Nutrition Subsidy", "Staffing Rebate", "Facility Upgrade"
        string equityClause; // "Indexation Guarantee", "Eligibility Expansion", "Transparency Mandate"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    CharterEvent[] public events;

    event CharterLogged(
        string offsetType,
        string equityClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log aged care offset equity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCharter(
        string memory offsetType,
        string memory equityClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CharterEvent({
            offsetType: offsetType,
            equityClause: equityClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CharterLogged(offsetType, equityClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getCharterByIndex(uint256 index) external view returns (
        string memory offsetType,
        string memory equityClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CharterEvent memory c = events[index];
        return (
            c.offsetType,
            c.equityClause,
            c.clauseStatus,
            c.emotionalTag,
            c.timestamp
        );
    }
}
