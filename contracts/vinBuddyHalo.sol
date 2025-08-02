// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinBuddyHalo {
    mapping(address => address) public assignedBuddy;

    event BuddyAssigned(address indexed worker, address indexed buddy, uint256 timestamp);

    function assignBuddy(address worker, address buddy) public {
        assignedBuddy[worker] = buddy;
        emit BuddyAssigned(worker, buddy, block.timestamp);
    }

    function getBuddy(address worker) public view returns (address) {
        return assignedBuddy[worker];
    }
}
