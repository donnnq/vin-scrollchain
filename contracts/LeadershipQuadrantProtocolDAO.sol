// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title LeadershipQuadrantProtocolDAO
 * @dev Emotionally tagged smart contract to log leadership actions across four corridors:
 * Team, Upward, Outward, and Self — scrollchain-sealed mastery.
 */

contract LeadershipQuadrantProtocolDAO {
    address public steward;

    struct Action {
        address initiator;
        string quadrant; // "Team", "Up", "Out", "Self"
        string actionType;
        string emotionalTag;
        uint256 timestamp;
    }

    Action[] public actions;

    event LeadershipActionLogged(address indexed initiator, string quadrant, string actionType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log leadership actions");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAction(address initiator, string memory quadrant, string memory actionType, string memory emotionalTag) external onlySteward {
        actions.push(Action({
            initiator: initiator,
            quadrant: quadrant,
            actionType: actionType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit LeadershipActionLogged(initiator, quadrant, actionType, emotionalTag, block.timestamp);
    }

    function getActionByIndex(uint256 index) external view returns (address initiator, string memory quadrant, string memory actionType, string memory emotionalTag, uint256 timestamp) {
        require(index < actions.length, "Scrollstorm index out of bounds");
        Action memory a = actions[index];
        return (a.initiator, a.quadrant, a.actionType, a.emotionalTag, a.timestamp);
    }
}
