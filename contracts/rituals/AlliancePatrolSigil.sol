// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title AlliancePatrolSigil — Ritual-grade contract for allied patrol deployment
/// @notice Enables trusted allies to join territorial defense with encoded dignity

contract AlliancePatrolSigil {
    address public scrollsmith;

    struct Ally {
        string name;
        address commander;
        uint256 deployedUnits;
        bool approved;
    }

    mapping(address => Ally) public allies;
    string[] public activeAllies;

    event AllyApproved(string name, address commander);
    event PatrolDeployed(string name, uint256 units);
    event CoalitionChant(string message);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function approveAlly(address commander, string calldata name) external onlyScrollsmith {
        allies[commander] = Ally(name, commander, 0, true);
        activeAllies.push(name);
        emit AllyApproved(name, commander);
    }

    function deployPatrol(address commander, uint256 units) external {
        Ally storage ally = allies[commander];
        require(ally.approved, "Not approved");
        require(msg.sender == commander, "Only commander");

        ally.deployedUnits += units;
        emit PatrolDeployed(ally.name, units);
    }

    function chantCoalition() external onlyScrollsmith {
        emit CoalitionChant("From Pacific winds to West Sea tides, the alliance stands encoded.");
    }

    function getActiveAllies() external view returns (string[] memory) {
        return activeAllies;
    }
}
