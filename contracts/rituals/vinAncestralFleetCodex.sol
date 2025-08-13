// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinAncestralFleetCodex {
    struct Vessel {
        string name;
        string origin;
        string legacy;
        uint256 timestamp;
        address enshrinedBy;
    }

    Vessel[] public codex;

    event VesselEnshrined(string name, string origin, string legacy, address enshrinedBy);

    function enshrineVessel(string memory name, string memory origin, string memory legacy) public {
        codex.push(Vessel(name, origin, legacy, block.timestamp, msg.sender));
        emit VesselEnshrined(name, origin, legacy, msg.sender);
    }

    function getVessel(uint index) public view returns (
        string memory, string memory, string memory, uint256, address
    ) {
        Vessel memory v = codex[index];
        return (v.name, v.origin, v.legacy, v.timestamp, v.enshrinedBy);
    }

    function totalVessels() public view returns (uint) {
        return codex.length;
    }
}
