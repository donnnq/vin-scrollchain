// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollIndex {
    enum EntityType { Agent, Sigil, Relic, Scroll, Avatar, Sanctum }

    struct Entry {
        EntityType entityType;
        string name;
        string description;
        address associatedAddress;
        uint256 timestamp;
    }

    Entry[] public entries;
    mapping(string => uint256) public nameToId;
    address public immutable indexKeeper;

    event EntryRegistered(uint256 indexed id, EntityType entityType, string name, address associatedAddress, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == indexKeeper, "Not the index keeper");
        _;
    }

    constructor() {
        indexKeeper = msg.sender;
    }

    function registerEntry(
        EntityType entityType,
        string calldata name,
        string calldata description,
        address associatedAddress
    ) external onlyKeeper {
        require(nameToId[name] == 0, "Name already registered");

        entries.push(Entry({
            entityType: entityType,
            name: name,
            description: description,
            associatedAddress: associatedAddress,
            timestamp: block.timestamp
        }));

        nameToId[name] = entries.length; // 1-based index
        emit EntryRegistered(entries.length - 1, entityType, name, associatedAddress, block.timestamp);
    }

    function getEntryById(uint256 id) external view returns (Entry memory) {
        require(id < entries.length, "Invalid ID");
        return entries[id];
    }

    function getEntryByName(string calldata name) external view returns (Entry memory) {
        uint256 id = nameToId[name];
        require(id > 0, "Name not found");
        return entries[id - 1];
    }

    function totalEntries() external view returns (uint256) {
        return entries.length;
    }
}
