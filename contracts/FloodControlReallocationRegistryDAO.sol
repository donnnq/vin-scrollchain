// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FloodControlReallocationRegistryDAO {
    address public steward;

    struct ReallocationEvent {
        string originalPurpose; // "Flood Control"
        string newPurpose; // "PhilHealth", "AICS", "Medical Aid"
        uint256 amount;
        string emotionalTag;
        uint256 timestamp;
    }

    ReallocationEvent[] public events;

    event ReallocationLogged(
        string originalPurpose,
        string newPurpose,
        uint256 amount,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log reallocation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logReallocation(
        string memory originalPurpose,
        string memory newPurpose,
        uint256 amount,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ReallocationEvent({
            originalPurpose: originalPurpose,
            newPurpose: newPurpose,
            amount: amount,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ReallocationLogged(originalPurpose, newPurpose, amount, emotionalTag, block.timestamp);
    }

    function getReallocationByIndex(uint256 index) external view returns (
        string memory originalPurpose,
        string memory newPurpose,
        uint256 amount,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ReallocationEvent memory r = events[index];
        return (
            r.originalPurpose,
            r.newPurpose,
            r.amount,
            r.emotionalTag,
            r.timestamp
        );
    }
}
