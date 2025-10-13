// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ShutdownLeakAuditDAO
 * @dev Emotionally tagged smart contract to log legislative leak rituals,
 * budget drama, and strategic containment — scrollchain-sealed consequence.
 */

contract ShutdownLeakAuditDAO {
    address public steward;

    struct LeakEvent {
        address initiator;
        string leakSource; // e.g. "Chuck Schumer", "Staff Memo"
        string leakType; // "Budget", "Shutdown Plan", "Narrative Strategy"
        string emotionalTag;
        uint256 timestamp;
    }

    LeakEvent[] public events;

    event LeakLogged(address indexed initiator, string leakSource, string leakType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log shutdown leak rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logLeak(address initiator, string memory leakSource, string memory leakType, string memory emotionalTag) external onlySteward {
        events.push(LeakEvent({
            initiator: initiator,
            leakSource: leakSource,
            leakType: leakType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LeakLogged(initiator, leakSource, leakType, emotionalTag, block.timestamp);
    }

    function getLeakByIndex(uint256 index) external view returns (address initiator, string memory leakSource, string memory leakType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        LeakEvent memory l = events[index];
        return (l.initiator, l.leakSource, l.leakType, l.emotionalTag, l.timestamp);
    }
}
