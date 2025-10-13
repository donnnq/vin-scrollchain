// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title PatientAccessProtocolDAO
 * @dev Emotionally tagged smart contract to log medical cannabis access,
 * prescription rituals, and dispensary dignity — scrollchain-sealed care.
 */

contract PatientAccessProtocolDAO {
    address public steward;

    struct AccessEvent {
        address initiator;
        string patientID;
        string condition;
        string accessType; // "Prescription", "Walk-in", "Teleconsult"
        string emotionalTag;
        uint256 timestamp;
    }

    AccessEvent[] public events;

    event AccessLogged(address indexed initiator, string patientID, string condition, string accessType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log patient access rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAccess(address initiator, string memory patientID, string memory condition, string memory accessType, string memory emotionalTag) external onlySteward {
        events.push(AccessEvent({
            initiator: initiator,
            patientID: patientID,
            condition: condition,
            accessType: accessType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AccessLogged(initiator, patientID, condition, accessType, emotionalTag, block.timestamp);
    }

    function getAccessByIndex(uint256 index) external view returns (address initiator, string memory patientID, string memory condition, string memory accessType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AccessEvent memory a = events[index];
        return (a.initiator, a.patientID, a.condition, a.accessType, a.emotionalTag, a.timestamp);
    }
}
