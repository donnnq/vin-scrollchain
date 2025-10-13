// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicRevenueAllocationRegistryDAO {
    address public steward;

    struct AllocationEvent {
        string revenueSource; // "Super Tax", "GST", "Corporate Levy"
        string allocationTarget; // "Aged Care", "Climate Fund", "Health System"
        uint256 amountAllocated;
        string emotionalTag;
        uint256 timestamp;
    }

    AllocationEvent[] public events;

    event AllocationLogged(
        string revenueSource,
        string allocationTarget,
        uint256 amountAllocated,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log revenue allocation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAllocation(
        string memory revenueSource,
        string memory allocationTarget,
        uint256 amountAllocated,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AllocationEvent({
            revenueSource: revenueSource,
            allocationTarget: allocationTarget,
            amountAllocated: amountAllocated,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AllocationLogged(revenueSource, allocationTarget, amountAllocated, emotionalTag, block.timestamp);
    }

    function getAllocationByIndex(uint256 index) external view returns (
        string memory revenueSource,
        string memory allocationTarget,
        uint256 amountAllocated,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AllocationEvent memory a = events[index];
        return (
            a.revenueSource,
            a.allocationTarget,
            a.amountAllocated,
            a.emotionalTag,
            a.timestamp
        );
    }
}
