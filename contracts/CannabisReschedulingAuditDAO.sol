// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisReschedulingAuditDAO
 * @dev Emotionally tagged smart contract to log cannabis rescheduling efforts,
 * policy shifts, and emotional consequence — scrollchain-sealed reform.
 */

contract CannabisReschedulingAuditDAO {
    address public steward;

    struct Reschedule {
        address initiator;
        string country;
        string oldSchedule;
        string newSchedule;
        string emotionalTag;
        uint256 timestamp;
    }

    Reschedule[] public reschedules;

    event ReschedulingLogged(address indexed initiator, string country, string oldSchedule, string newSchedule, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log rescheduling reforms");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logReschedule(address initiator, string memory country, string memory oldSchedule, string memory newSchedule, string memory emotionalTag) external onlySteward {
        reschedules.push(Reschedule({
            initiator: initiator,
            country: country,
            oldSchedule: oldSchedule,
            newSchedule: newSchedule,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ReschedulingLogged(initiator, country, oldSchedule, newSchedule, emotionalTag, block.timestamp);
    }

    function getRescheduleByIndex(uint256 index) external view returns (address initiator, string memory country, string memory oldSchedule, string memory newSchedule, string memory emotionalTag, uint256 timestamp) {
        require(index < reschedules.length, "Scrollstorm index out of bounds");
        Reschedule memory r = reschedules[index];
        return (r.initiator, r.country, r.oldSchedule, r.newSchedule, r.emotionalTag, r.timestamp);
    }
}
