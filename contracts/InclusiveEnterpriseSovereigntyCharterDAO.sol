// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InclusiveEnterpriseSovereigntyCharterDAO {
    address public steward;

    struct CharterEvent {
        string coopName;
        string sovereigntyClause; // "Tax Exemption", "Audit Immunity", "Grassroots Dignity"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    CharterEvent[] public events;

    event CharterLogged(
        string coopName,
        string sovereigntyClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log enterprise sovereignty treaties");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCharter(
        string memory coopName,
        string memory sovereigntyClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CharterEvent({
            coopName: coopName,
            sovereigntyClause: sovereigntyClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CharterLogged(coopName, sovereigntyClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getCharterByIndex(uint256 index) external view returns (
        string memory coopName,
        string memory sovereigntyClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CharterEvent memory c = events[index];
        return (
            c.coopName,
            c.sovereigntyClause,
            c.clauseStatus,
            c.emotionalTag,
            c.timestamp
        );
    }
}
