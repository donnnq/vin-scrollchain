// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinTribalAuraBalancer - Ritual contract for stabilizing tribal militia influence in civic systems
/// @author Vinvin
/// @notice Balances aura levels of tribal factions to prevent destabilization
/// @dev Designed for use in fragmented parliaments and decentralized governance rituals

contract vinTribalAuraBalancer {
    address public scrollsmith;
    uint256 public lastAudit;

    struct TribalFaction {
        string name;
        uint256 auraLevel; // 0 = dormant, 100 = volatile
        bool militiaLinked;
        bool civicAligned;
        uint256 lastBalance;
    }

    TribalFaction[] public factions;

    event FactionRegistered(string name, bool militiaLinked);
    event AuraAdjusted(string name, uint256 newLevel);
    event CivicAlignmentUpdated(string name, bool aligned);
    event RitualAuditTriggered(uint256 timestamp);

    constructor() {
        scrollsmith = msg.sender;
        lastAudit = block.timestamp;
    }

    function registerFaction(string memory name, bool militiaLinked) public {
        factions.push(TribalFaction(name, 50, militiaLinked, false, block.timestamp));
        emit FactionRegistered(name, militiaLinked);
    }

    function adjustAura(uint256 index, int256 delta) public {
        require(index < factions.length, "Invalid index");

        uint256 current = factions[index].auraLevel;
        int256 updated = int256(current) + delta;

        if (updated < 0) updated = 0;
        if (updated > 100) updated = 100;

        factions[index].auraLevel = uint256(updated);
        factions[index].lastBalance = block.timestamp;

        emit AuraAdjusted(factions[index].name, factions[index].auraLevel);
    }

    function updateCivicAlignment(uint256 index, bool aligned) public {
        require(index < factions.length, "Invalid index");
        factions[index].civicAligned = aligned;
        emit CivicAlignmentUpdated(factions[index].name, aligned);
    }

    function triggerAudit() public {
        lastAudit = block.timestamp;
        emit RitualAuditTriggered(block.timestamp);
    }

    function getFaction(uint256 index) public view returns (TribalFaction memory) {
        require(index < factions.length, "Invalid index");
        return factions[index];
    }

    function totalFactions() public view returns (uint256) {
        return factions.length;
    }
}
