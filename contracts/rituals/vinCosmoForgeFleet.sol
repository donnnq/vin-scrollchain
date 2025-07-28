// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IvinCosmoForge {
    function deployVessel(uint256 id) external;
    function getVesselStatus(uint256 id) external view returns (string memory name, string memory status);
}

interface IvinCommandMind {
    function negotiate(address counterparty) external view returns (string memory verdict);
}

contract vinCosmoForgeFleet {
    address public fleetOverlord;
    address public forgeContract;
    address public commandMindContract;

    modifier onlyOverlord() {
        require(msg.sender == fleetOverlord, "Unauthorized access.");
        _;
    }

    event FleetOrderExecuted(uint256 indexed vesselID, string verdict);

    constructor(address _forgeContract, address _commandMindContract) {
        fleetOverlord = msg.sender;
        forgeContract = _forgeContract;
        commandMindContract = _commandMindContract;
    }

    function executeFleetOrder(uint256 vesselID, address counterparty) external onlyOverlord {
        string memory verdict = IvinCommandMind(commandMindContract).negotiate(counterparty);
        if (keccak256(bytes(verdict)) == keccak256(bytes("Proceed. Trust channel open."))) {
            IvinCosmoForge(forgeContract).deployVessel(vesselID);
        }
        emit FleetOrderExecuted(vesselID, verdict);
    }

    function scanVesselStatus(uint256 vesselID) external view returns (string memory name, string memory status) {
        return IvinCosmoForge(forgeContract).getVesselStatus(vesselID);
    }
}
