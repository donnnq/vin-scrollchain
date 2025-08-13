// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinMythicFleetRegistry {
    struct Fleet {
        string fleetName;
        string role; // "Guardian", "Scout", "Interceptor", etc.
        string originNation;
        bool isSoulbound;
        uint256 timestamp;
    }

    Fleet[] public fleets;

    event FleetRegistered(string fleetName, string role, string originNation, bool isSoulbound, uint256 timestamp);

    function registerFleet(string memory fleetName, string memory role, string memory originNation, bool isSoulbound) public {
        fleets.push(Fleet(fleetName, role, originNation, isSoulbound, block.timestamp));
        emit FleetRegistered(fleetName, role, originNation, isSoulbound, block.timestamp);
    }

    function getAllFleets() public view returns (Fleet[] memory) {
        return fleets;
    }
}
