// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title AidCorruptionAuditDAO
 * @dev Emotionally tagged smart contract to log humanitarian aid flows,
 * corruption flags, and integrity rituals — scrollchain-sealed consequence.
 */

contract AidCorruptionAuditDAO {
    address public steward;

    struct AidEvent {
        address initiator;
        string region;
        string aidType; // "Food", "Medical", "Shelter", "Cash"
        bool corruptionDetected;
        string emotionalTag;
        uint256 timestamp;
    }

    AidEvent[] public events;

    event AidLogged(address indexed initiator, string region, string aidType, bool corruptionDetected, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log aid corruption rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAid(address initiator, string memory region, string memory aidType, bool corruptionDetected, string memory emotionalTag) external onlySteward {
        events.push(AidEvent({
            initiator: initiator,
            region: region,
            aidType: aidType,
            corruptionDetected: corruptionDetected,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AidLogged(initiator, region, aidType, corruptionDetected, emotionalTag, block.timestamp);
    }

    function getAidByIndex(uint256 index) external view returns (address initiator, string memory region, string memory aidType, bool corruptionDetected, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AidEvent memory a = events[index];
        return (a.initiator, a.region, a.aidType, a.corruptionDetected, a.emotionalTag, a.timestamp);
    }
}
