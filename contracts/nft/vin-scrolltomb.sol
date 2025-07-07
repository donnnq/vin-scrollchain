// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollTomb {
    enum TombType { Scroll, Ritual, Soul }

    struct Tombstone {
        TombType tombType;
        string name;
        string reason;
        address formerHolder;
        uint256 timestamp;
    }

    Tombstone[] public tombstones;
    address public immutable tombkeeper;

    event TombstonePlaced(uint256 indexed id, TombType tombType, string name, address formerHolder, string reason, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == tombkeeper, "Not the tombkeeper");
        _;
    }

    constructor() {
        tombkeeper = msg.sender;
    }

    function placeTombstone(
        TombType tombType,
        string calldata name,
        string calldata reason,
        address formerHolder
    ) external onlyKeeper {
        tombstones.push(Tombstone({
            tombType: tombType,
            name: name,
            reason: reason,
            formerHolder: formerHolder,
            timestamp: block.timestamp
        }));

        emit TombstonePlaced(tombstones.length - 1, tombType, name, formerHolder, reason, block.timestamp);
    }

    function getTombstone(uint256 id) external view returns (Tombstone memory) {
        require(id < tombstones.length, "Invalid tombstone ID");
        return tombstones[id];
    }

    function totalTombstones() external view returns (uint256) {
        return tombstones.length;
    }
}
