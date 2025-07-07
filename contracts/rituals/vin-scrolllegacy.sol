// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollLegacy {
    enum EntityType { Soul, Scroll, Sanctum }

    struct LegacyEntry {
        EntityType entityType;
        address entity;
        string title;
        string eventType; // e.g. "Oath", "Trial", "Rebirth", "Ascension"
        string description;
        uint256 timestamp;
    }

    LegacyEntry[] public legacy;
    mapping(address => uint256[]) public entityToEntries;
    address public immutable legacyKeeper;

    event LegacyWritten(
        uint256 indexed id,
        EntityType entityType,
        address indexed entity,
        string eventType,
        string title,
        string description,
        uint256 timestamp
    );

    modifier onlyKeeper() {
        require(msg.sender == legacyKeeper, "Not the legacy keeper");
        _;
    }

    constructor() {
        legacyKeeper = msg.sender;
    }

    function writeLegacy(
        EntityType entityType,
        address entity,
        string calldata title,
        string calldata eventType,
        string calldata description
    ) external onlyKeeper {
        legacy.push(LegacyEntry({
            entityType: entityType,
            entity: entity,
            title: title,
            eventType: eventType,
            description: description,
            timestamp: block.timestamp
        }));

        entityToEntries[entity].push(legacy.length - 1);

        emit LegacyWritten(
            legacy.length - 1,
            entityType,
            entity,
            eventType,
            title,
            description,
            block.timestamp
        );
    }

    function getLegacyByEntity(address entity) external view returns (LegacyEntry[] memory) {
        uint256[] memory ids = entityToEntries[entity];
        LegacyEntry[] memory entries = new LegacyEntry[](ids.length);
        for (uint256 i = 0; i < ids.length; i++) {
            entries[i] = legacy[ids[i]];
        }
        return entries;
    }

    function totalLegacyEntries() external view returns (uint256) {
        return legacy.length;
    }
}
