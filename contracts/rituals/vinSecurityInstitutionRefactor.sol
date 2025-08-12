// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinSecurityInstitutionRefactor - Ritual contract for restructuring hybrid civic-militia entities
/// @author Vinvin
/// @notice Refactors aura-heavy security institutions into legally coherent civic guardians
/// @dev Designed for use in post-conflict governance and aura stabilization

contract vinSecurityInstitutionRefactor {
    address public scrollsmith;
    uint256 public lastReform;

    struct SecurityEntity {
        string name;
        bool tribalLinked;
        bool legallyDefined;
        bool spirituallyAligned;
        uint256 auraLevel; // 0 = dormant, 100 = volatile
        uint256 lastUpdate;
    }

    SecurityEntity[] public entities;

    event EntityRegistered(string name, bool tribalLinked);
    event LegalDefinitionUpdated(string name, bool defined);
    event SpiritualAlignmentUpdated(string name, bool aligned);
    event AuraAdjusted(string name, uint256 newLevel);
    event ReformTriggered(string name, uint256 timestamp);

    constructor() {
        scrollsmith = msg.sender;
        lastReform = block.timestamp;
    }

    function registerEntity(string memory name, bool tribalLinked) public {
        entities.push(SecurityEntity(name, tribalLinked, false, false, 50, block.timestamp));
        emit EntityRegistered(name, tribalLinked);
    }

    function updateLegalDefinition(uint256 index, bool defined) public {
        require(index < entities.length, "Invalid index");
        entities[index].legallyDefined = defined;
        emit LegalDefinitionUpdated(entities[index].name, defined);
    }

    function updateSpiritualAlignment(uint256 index, bool aligned) public {
        require(index < entities.length, "Invalid index");
        entities[index].spirituallyAligned = aligned;
        emit SpiritualAlignmentUpdated(entities[index].name, aligned);
    }

    function adjustAura(uint256 index, int256 delta) public {
        require(index < entities.length, "Invalid index");

        uint256 current = entities[index].auraLevel;
        int256 updated = int256(current) + delta;

        if (updated < 0) updated = 0;
        if (updated > 100) updated = 100;

        entities[index].auraLevel = uint256(updated);
        entities[index].lastUpdate = block.timestamp;

        emit AuraAdjusted(entities[index].name, entities[index].auraLevel);
    }

    function triggerReform(uint256 index) public {
        require(index < entities.length, "Invalid index");
        entities[index].lastUpdate = block.timestamp;
        lastReform = block.timestamp;
        emit ReformTriggered(entities[index].name, block.timestamp);
    }

    function getEntity(uint256 index) public view returns (SecurityEntity memory) {
        require(index < entities.length, "Invalid index");
        return entities[index];
    }

    function totalEntities() public view returns (uint256) {
        return entities.length;
    }
}
