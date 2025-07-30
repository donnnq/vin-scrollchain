// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCommonsForge {
    struct Zone {
        string name;
        string focus;
        uint talentPool;
    }

    mapping(string => Zone) public innovationZones;

    function createZone(string memory name, string memory focus, uint talent) public {
        innovationZones[name] = Zone(name, focus, talent);
    }

    function getZone(string memory name) public view returns (Zone memory) {
        return innovationZones[name];
    }
}
