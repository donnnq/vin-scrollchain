// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollVeilKey {
    struct VeilKey {
        string name;
        string unlocks; // e.g. "Sanctum:FlameVault", "Scroll:vin-scrollmirror"
        address bearer;
        bool active;
        uint256 issuedAt;
    }

    VeilKey[] public keys;
    mapping(string => uint256) public nameToId;
    address public immutable keymaster;

    event KeyIssued(uint256 indexed id, string name, address bearer, string unlocks, uint256 timestamp);
    event KeyRevoked(uint256 indexed id, uint256 timestamp);

    modifier onlyKeymaster() {
        require(msg.sender == keymaster, "Not the keymaster");
        _;
    }

    constructor() {
        keymaster = msg.sender;
    }

    function issueKey(
        string calldata name,
        string calldata unlocks,
        address bearer
    ) external onlyKeymaster {
        require(nameToId[name] == 0, "Key already exists");

        keys.push(VeilKey({
            name: name,
            unlocks: unlocks,
            bearer: bearer,
            active: true,
            issuedAt: block.timestamp
        }));

        nameToId[name] = keys.length;
        emit KeyIssued(keys.length - 1, name, bearer, unlocks, block.timestamp);
    }

    function revokeKey(uint256 id) external onlyKeymaster {
        require(id < keys.length, "Invalid key ID");
        keys[id].active = false;
        emit KeyRevoked(id, block.timestamp);
    }

    function getKey(uint256 id) external view returns (VeilKey memory) {
        require(id < keys.length, "Invalid key ID");
        return keys[id];
    }

    function totalKeys() external view returns (uint256) {
        return keys.length;
    }
}
