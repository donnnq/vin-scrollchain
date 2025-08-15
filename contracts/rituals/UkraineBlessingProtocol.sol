// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UkraineBlessingProtocol {
    address public steward;
    uint public deployedArmy;
    uint public deployedTanks;
    uint public deployedAirSupport;

    mapping(address => bool) public allies;
    mapping(address => uint) public blessings;

    event ForcesDeployed(uint army, uint tanks, uint air);
    event AllyJoined(address ally, uint blessing);

    constructor() {
        steward = msg.sender;
    }

    function deployForces(uint army, uint tanks, uint air) public {
        require(msg.sender == steward, "Only steward can deploy.");
        deployedArmy += army;
        deployedTanks += tanks;
        deployedAirSupport += air;
        emit ForcesDeployed(army, tanks, air);
    }

    function joinAsAlly(address ally) public {
        require(!allies[ally], "Already joined.");
        allies[ally] = true;
        blessings[ally] = 1000; // Initial blessing in civic tokens
        emit AllyJoined(ally, blessings[ally]);
    }

    function updateBlessing(address ally, uint amount) public {
        require(msg.sender == steward, "Only steward can update.");
        require(allies[ally], "Not an ally.");
        blessings[ally] += amount;
    }
}
