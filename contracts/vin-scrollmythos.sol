// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollMythos {
    enum Phase { Born, Tombed, Reborn }

    struct Myth {
        string name;
        string origin;
        string essence;
        Phase[] phases;
        string[] transformations;
        address keeper;
        uint256 timestamp;
    }

    mapping(bytes32 => Myth) public myths;
    bytes32[] public mythKeys;
    address public immutable mythosKeeper;

    event MythCreated(bytes32 indexed id, string name, string origin, string essence, address keeper, uint256 timestamp);
    event MythPhaseAdded(bytes32 indexed id, Phase phase, string transformation, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == mythosKeeper, "Not the mythos keeper");
        _;
    }

    constructor() {
        mythosKeeper = msg.sender;
    }

    function createMyth(
        string calldata name,
        string calldata origin,
        string calldata essence
    ) external onlyKeeper returns (bytes32) {
        bytes32 id = keccak256(abi.encodePacked(name, origin, block.timestamp));
        require(myths[id].timestamp == 0, "Myth already exists");

        myths[id] = Myth({
            name: name,
            origin: origin,
            essence: essence,
            phases: new Phase[](0),
            transformations: new string[](0),
            keeper: msg.sender,
            timestamp: block.timestamp
        });

        mythKeys.push(id);
        emit MythCreated(id, name, origin, essence, msg.sender, block.timestamp);
        return id;
    }

    function addPhase(bytes32 id, Phase phase, string calldata transformation) external onlyKeeper {
        require(myths[id].timestamp != 0, "Myth not found");
        myths[id].phases.push(phase);
        myths[id].transformations.push(transformation);
        emit MythPhaseAdded(id, phase, transformation, block.timestamp);
    }

    function getMyth(bytes32 id) external view returns (Myth memory) {
        return myths[id];
    }

    function totalMyths() external view returns (uint256) {
        return mythKeys.length;
    }
}
