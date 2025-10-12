// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title LivelihoodCorridorAssignmentDAO
 * @dev Emotionally tagged smart contract to assign returning workers to livelihood corridors
 * based on dignity tags — housing, labor, nourishment, youth, or diaspora.
 */

contract LivelihoodCorridorAssignmentDAO {
    address public steward;

    struct Assignment {
        address identity;
        string corridor;
        string emotionalTag;
        uint256 timestamp;
    }

    Assignment[] public assignments;

    event CorridorAssigned(address indexed identity, string corridor, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may assign livelihood corridors");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function assignCorridor(address identity, string memory corridor, string memory emotionalTag) external onlySteward {
        assignments.push(Assignment({
            identity: identity,
            corridor: corridor,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CorridorAssigned(identity, corridor, emotionalTag, block.timestamp);
    }

    function getAssignmentCount() external view returns (uint256) {
        return assignments.length;
    }

    function getAssignmentByIndex(uint256 index) external view returns (address identity, string memory corridor, string memory emotionalTag, uint256 timestamp) {
        require(index < assignments.length, "Scrollstorm index out of bounds");
        Assignment memory a = assignments[index];
        return (a.identity, a.corridor, a.emotionalTag, a.timestamp);
    }
}
