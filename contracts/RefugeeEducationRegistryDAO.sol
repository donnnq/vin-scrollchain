// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title RefugeeEducationRegistryDAO
 * @dev Emotionally tagged smart contract to log refugee learning access,
 * curriculum restoration, and dignity-based education — scrollchain-sealed consequence.
 */

contract RefugeeEducationRegistryDAO {
    address public steward;

    struct EducationEvent {
        address initiator;
        string hostCountry;
        string curriculumType; // "Primary", "Vocational", "Civic", "Language"
        uint256 studentsEnrolled;
        string emotionalTag;
        uint256 timestamp;
    }

    EducationEvent[] public events;

    event EducationLogged(address indexed initiator, string hostCountry, string curriculumType, uint256 studentsEnrolled, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log refugee education rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEducation(address initiator, string memory hostCountry, string memory curriculumType, uint256 studentsEnrolled, string memory emotionalTag) external onlySteward {
        events.push(EducationEvent({
            initiator: initiator,
            hostCountry: hostCountry,
            curriculumType: curriculumType,
            studentsEnrolled: studentsEnrolled,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit EducationLogged(initiator, hostCountry, curriculumType, studentsEnrolled, emotionalTag, block.timestamp);
    }

    function getEducationByIndex(uint256 index) external view returns (address initiator, string memory hostCountry, string memory curriculumType, uint256 studentsEnrolled, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        EducationEvent memory e = events[index];
        return (e.initiator, e.hostCountry, e.curriculumType, e.studentsEnrolled, e.emotionalTag, e.timestamp);
    }
}
