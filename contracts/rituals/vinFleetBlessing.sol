// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinFleetBlessing {
    struct Blessing {
        string fleetName;
        string region;
        string invocation;
        uint256 timestamp;
        address scrollsmith;
    }

    Blessing[] public blessings;

    event FleetBlessed(string fleetName, string region, string invocation, address scrollsmith);

    function blessFleet(string memory fleetName, string memory region, string memory invocation) public {
        blessings.push(Blessing(fleetName, region, invocation, block.timestamp, msg.sender));
        emit FleetBlessed(fleetName, region, invocation, msg.sender);
    }

    function getBlessing(uint index) public view returns (
        string memory, string memory, string memory, uint256, address
    ) {
        Blessing memory b = blessings[index];
        return (b.fleetName, b.region, b.invocation, b.timestamp, b.scrollsmith);
    }

    function totalBlessings() public view returns (uint) {
        return blessings.length;
    }
}
