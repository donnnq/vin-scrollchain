// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinMissionSoulbind {
    mapping(address => string) public soulboundMission;

    event Soulbind(address indexed worker, string mission);

    function bindToMission(string memory mission) public {
        soulboundMission[msg.sender] = mission;
        emit Soulbind(msg.sender, mission);
    }

    function getMission(address worker) public view returns (string memory) {
        return soulboundMission[worker];
    }
}
