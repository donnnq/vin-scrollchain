// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title WageSanctumDAO
 * @dev Emotionally tagged smart contract to log wage rituals,
 * fair compensation, and labor dignity — scrollchain-sealed equity.
 */

contract WageSanctumDAO {
    address public steward;

    struct WageEvent {
        address initiator;
        string role;
        uint256 hoursWorked;
        uint256 compensation;
        string emotionalTag;
        uint256 timestamp;
    }

    WageEvent[] public events;

    event WageLogged(address indexed initiator, string role, uint256 hoursWorked, uint256 compensation, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log wage sanctum rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logWage(address initiator, string memory role, uint256 hoursWorked, uint256 compensation, string memory emotionalTag) external onlySteward {
        events.push(WageEvent({
            initiator: initiator,
            role: role,
            hoursWorked: hoursWorked,
            compensation: compensation,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit WageLogged(initiator, role, hoursWorked, compensation, emotionalTag, block.timestamp);
    }

    function getWageByIndex(uint256 index) external view returns (address initiator, string memory role, uint256 hoursWorked, uint256 compensation, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        WageEvent memory w = events[index];
        return (w.initiator, w.role, w.hoursWorked, w.compensation, w.emotionalTag, w.timestamp);
    }
}
