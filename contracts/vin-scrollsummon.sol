// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollSummon {
    enum EntityType { Soul, Scroll, Sanctum }

    struct Summon {
        string name;
        EntityType[] types;
        address[] entities;
        string purpose;
        bool active;
        uint256 summonedAt;
    }

    Summon[] public summons;
    address public immutable summoner;

    event SummonCreated(uint256 indexed id, string name, string purpose, uint256 timestamp);
    event EntityAdded(uint256 indexed id, EntityType entityType, address entity, uint256 timestamp);
    event SummonDismissed(uint256 indexed id, uint256 timestamp);

    modifier onlySummoner() {
        require(msg.sender == summoner, "Not the summoner");
        _;
    }

    constructor() {
        summoner = msg.sender;
    }

    function createSummon(string calldata name, string calldata purpose) external onlySummoner {
        summons.push(Summon({
            name: name,
            types: new EntityType[](0),
            entities: new address[](0),
            purpose: purpose,
            active: true,
            summonedAt: block.timestamp
        }));

        emit SummonCreated(summons.length - 1, name, purpose, block.timestamp);
    }

    function addEntity(uint256 id, EntityType entityType, address entity) external onlySummoner {
        require(id < summons.length, "Invalid summon ID");
        require(summons[id].active, "Summon is dismissed");

        summons[id].types.push(entityType);
        summons[id].entities.push(entity);

        emit EntityAdded(id, entityType, entity, block.timestamp);
    }

    function dismissSummon(uint256 id) external onlySummoner {
        require(id < summons.length, "Invalid summon ID");
        summons[id].active = false;
        emit SummonDismissed(id, block.timestamp);
    }

    function getSummon(uint256 id) external view returns (Summon memory) {
        require(id < summons.length, "Invalid summon ID");
        return summons[id];
    }

    function totalSummons() external view returns (uint256) {
        return summons.length;
    }
}
