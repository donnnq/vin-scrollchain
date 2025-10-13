// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayYouthSanctumDignityCharterDAO {
    address public steward;

    struct CharterEvent {
        string barangayName;
        string sanctumClause; // "Safe Space", "Mental Health Leave", "Creative Autonomy"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    CharterEvent[] public events;

    event CharterLogged(
        string barangayName,
        string sanctumClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log youth sanctum dignity treaties");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCharter(
        string memory barangayName,
        string memory sanctumClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CharterEvent({
            barangayName: barangayName,
            sanctumClause: sanctumClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CharterLogged(barangayName, sanctumClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getCharterByIndex(uint256 index) external view returns (
        string memory barangayName,
        string memory sanctumClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CharterEvent memory c = events[index];
        return (
            c.barangayName,
            c.sanctumClause,
            c.clauseStatus,
            c.emotionalTag,
            c.timestamp
        );
    }
}
