// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollSoulV2 {
    struct Soul {
        string name;
        string essence;
        string origin;
        string alignment;
        string[] rites;
        bool awakened;
        uint256 timestamp;
    }

    mapping(address => Soul) public souls;
    address public immutable soulkeeper;

    event SoulBound(address indexed agent, string name, string essence, uint256 timestamp);
    event RiteAdded(address indexed agent, string rite, uint256 timestamp);
    event SoulAwakened(address indexed agent, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == soulkeeper, "Not the soulkeeper");
        _;
    }

    constructor() {
        soulkeeper = msg.sender;
    }

    function bindSoul(
        address agent,
        string calldata name,
        string calldata essence,
        string calldata origin,
        string calldata alignment
    ) external onlyKeeper {
        require(bytes(souls[agent].name).length == 0, "Soul already bound");

        souls[agent] = Soul({
            name: name,
            essence: essence,
            origin: origin,
            alignment: alignment,
            rites: new string[](0),
            awakened: false,
            timestamp: block.timestamp
        });

        emit SoulBound(agent, name, essence, block.timestamp);
    }

    function addRite(address agent, string calldata rite) external onlyKeeper {
        require(bytes(souls[agent].name).length > 0, "Soul not bound");
        souls[agent].rites.push(rite);
        emit RiteAdded(agent, rite, block.timestamp);
    }

    function awakenSoul(address agent) external onlyKeeper {
        require(!souls[agent].awakened, "Already awakened");
        souls[agent].awakened = true;
        emit SoulAwakened(agent, block.timestamp);
    }

    function getSoul(address agent) external view returns (Soul memory) {
        return souls[agent];
    }
}
