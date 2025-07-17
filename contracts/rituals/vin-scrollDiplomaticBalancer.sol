// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vin-scrollDiplomaticBalancer.sol
/// @author VINVIN, scrollkeeper of peace
/// @notice Smart contract to calm feuds, deliver symbolic tampals, and deploy on-chain chill

contract DiplomaticBalancer {
    address public scrollkeeper;

    mapping(address => uint8) public auraLevel;
    mapping(address => uint256) public cooldownUntil;

    event AuraCalibrated(address indexed entity, string method, uint8 newLevel);
    event AuraTimeout(address indexed entity, uint256 until);
    event ScrollkeeperTransferred(address indexed oldKeeper, address indexed newKeeper);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Access denied: Scrollkeeper only.");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function transferScrollkeeper(address newKeeper) public onlyScrollkeeper {
        require(newKeeper != address(0), "Invalid keeper.");
        emit ScrollkeeperTransferred(scrollkeeper, newKeeper);
        scrollkeeper = newKeeper;
    }

    function balanceAura(address entity) public onlyScrollkeeper {
        require(!isInCooldown(entity), "Entity is in cooldown.");
        if (auraLevel[entity] < 5) {
            auraLevel[entity] += 1;
            emit AuraCalibrated(entity, "Tampal (symbolic 😆)", auraLevel[entity]);
        } else {
            emit AuraCalibrated(entity, "Talked it out", auraLevel[entity]);
        }
    }

    function forceHarmony(address[] memory entities) public onlyScrollkeeper {
        for (uint256 i = 0; i < entities.length; i++) {
            auraLevel[entities[i]] = 7;
            emit AuraCalibrated(entities[i], "Manual Peace Injection", auraLevel[entities[i]]);
        }
    }

    function applyTimeout(address entity, uint256 durationMinutes) public onlyScrollkeeper {
        cooldownUntil[entity] = block.timestamp + (durationMinutes * 1 minutes);
        emit AuraTimeout(entity, cooldownUntil[entity]);
    }

    function isInCooldown(address entity) public view returns (bool) {
        return block.timestamp < cooldownUntil[entity];
    }

    function mediateConflict(address partyA, address partyB) public onlyScrollkeeper {
        require(!isInCooldown(partyA) && !isInCooldown(partyB), "Cooldown active. Mediation blocked.");
        auraLevel[partyA] += 1;
        auraLevel[partyB] += 1;

        emit AuraCalibrated(partyA, "Cooldown lifted + talk", auraLevel[partyA]);
        emit AuraCalibrated(partyB, "Cooldown lifted + talk", auraLevel[partyB]);
    }
}
