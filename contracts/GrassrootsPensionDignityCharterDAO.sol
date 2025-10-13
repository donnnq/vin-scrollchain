// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GrassrootsPensionDignityCharterDAO {
    address public steward;

    struct CharterEvent {
        string pensionGroup; // "Retirees", "Farm Owners", "Self-Managed Funds"
        string dignityClause; // "Offset Protection", "Liquidity Immunity", "Indexation Guarantee"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    CharterEvent[] public events;

    event CharterLogged(
        string pensionGroup,
        string dignityClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log pension dignity treaties");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCharter(
        string memory pensionGroup,
        string memory dignityClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CharterEvent({
            pensionGroup: pensionGroup,
            dignityClause: dignityClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CharterLogged(pensionGroup, dignityClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getCharterByIndex(uint256 index) external view returns (
        string memory pensionGroup,
        string memory dignityClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CharterEvent memory c = events[index];
        return (
            c.pensionGroup,
            c.dignityClause,
            c.clauseStatus,
            c.emotionalTag,
            c.timestamp
        );
    }
}
