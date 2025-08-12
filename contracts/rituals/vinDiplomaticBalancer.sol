// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinDiplomaticBalancer - Ritual contract for civic aura stabilization and alliance mediation
/// @author Vinvin
/// @notice Used to balance emotional and political tensions across factions
/// @dev Deployable on Scrollchain or used as symbolic civic artifact

contract vinDiplomaticBalancer {
    address public scrollsmith;
    uint256 public timestamp;

    struct Faction {
        string name;
        uint256 auraLevel; // 0 = unstable, 100 = fully aligned
        uint256 lastMediation;
        bool active;
    }

    Faction[] public factions;

    event FactionRegistered(string name);
    event AuraBalanced(string name, uint256 newLevel);
    event MediationTriggered(string name, uint256 timestamp);

    constructor() {
        scrollsmith = msg.sender;
        timestamp = block.timestamp;
    }

    function registerFaction(string memory name) public {
        factions.push(Faction(name, 50, block.timestamp, true));
        emit FactionRegistered(name);
    }

    function balanceAura(uint256 index, uint256 amount) public {
        require(index < factions.length, "Invalid index");
        require(factions[index].active, "Faction inactive");

        factions[index].auraLevel += amount;
        if (factions[index].auraLevel > 100) {
            factions[index].auraLevel = 100;
        }

        emit AuraBalanced(factions[index].name, factions[index].auraLevel);
    }

    function triggerMediation(uint256 index) public {
        require(index < factions.length, "Invalid index");
        factions[index].lastMediation = block.timestamp;
        emit MediationTriggered(factions[index].name, block.timestamp);
    }

    function getFaction(uint256 index) public view returns (Faction memory) {
        require(index < factions.length, "Invalid index");
        return factions[index];
    }

    function totalFactions() public view returns (uint256) {
        return factions.length;
    }
}
