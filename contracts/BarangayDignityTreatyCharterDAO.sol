// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayDignityTreatyCharterDAO {
    address public steward;

    struct TreatyEvent {
        string barangayName;
        string dignityClause; // "Hazard Pay", "Rest Days", "Uniform Allocation"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    TreatyEvent[] public events;

    event TreatyLogged(
        string barangayName,
        string dignityClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log barangay dignity treaties");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTreaty(
        string memory barangayName,
        string memory dignityClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TreatyEvent({
            barangayName: barangayName,
            dignityClause: dignityClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TreatyLogged(barangayName, dignityClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getTreatyByIndex(uint256 index) external view returns (
        string memory barangayName,
        string memory dignityClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TreatyEvent memory t = events[index];
        return (
            t.barangayName,
            t.dignityClause,
            t.clauseStatus,
            t.emotionalTag,
            t.timestamp
        );
    }
}
