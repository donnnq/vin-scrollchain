// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinCosmoForge {
    address public supremeCommand;
uint256 public fundVault = 200_000_000_000 ether; // symbolic representation in ETH scale

    struct Vessel {
        string name;
        string vesselType;
        uint256 energyCoreLevel;
        bool deployed;
    }

    mapping(uint256 => Vessel) public fleet;
    uint256 public vesselCount;

    event VesselForged(string name, string vesselType, uint256 energyCoreLevel);
    event VesselDeployed(uint256 indexed id);

    constructor() {
        supremeCommand = msg.sender;
    }

    function forgeVessel(string memory name, string memory vesselType, uint256 energyCoreLevel) external {
        require(msg.sender == supremeCommand, "Only Supreme Command can forge.");
        fleet[vesselCount] = Vessel(name, vesselType, energyCoreLevel, false);
        emit VesselForged(name, vesselType, energyCoreLevel);
        vesselCount++;
    }

    function deployVessel(uint256 id) external {
        require(msg.sender == supremeCommand, "Unauthorized deploy request.");
        require(!fleet[id].deployed, "Already deployed.");
        fleet[id].deployed = true;
        emit VesselDeployed(id);
    }

    function getVesselStatus(uint256 id) external view returns (string memory name, string memory status) {
        Vessel memory v = fleet[id];
        name = v.name;
        status = v.deployed ? "Interstellar" : "Hangar-bound";
    }
}
