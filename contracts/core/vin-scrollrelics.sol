// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollRelics {
    struct Relic {
        string name;
        string effect;
        string origin;
        address holder;
        bool active;
        uint256 timestamp;
    }

    Relic[] public relics;
    address public immutable relicKeeper;

    event RelicForged(uint256 indexed id, string name, string effect, string origin);
    event RelicBestowed(uint256 indexed id, address indexed to);
    event RelicRevoked(uint256 indexed id, address indexed from);

    modifier onlyKeeper() {
        require(msg.sender == relicKeeper, "Not the relic keeper");
        _;
    }

    constructor() {
        relicKeeper = msg.sender;
    }

    function forgeRelic(string calldata name, string calldata effect, string calldata origin) external onlyKeeper {
        relics.push(Relic({
            name: name,
            effect: effect,
            origin: origin,
            holder: address(0),
            active: false,
            timestamp: block.timestamp
        }));

        emit RelicForged(relics.length - 1, name, effect, origin);
    }

    function bestowRelic(uint256 id, address to) external onlyKeeper {
        require(id < relics.length, "Invalid relic");
        Relic storage r = relics[id];
        r.holder = to;
        r.active = true;
        emit RelicBestowed(id, to);
    }

    function revokeRelic(uint256 id) external onlyKeeper {
        require(id < relics.length, "Invalid relic");
        Relic storage r = relics[id];
        address previousHolder = r.holder;
        r.holder = address(0);
        r.active = false;
        emit RelicRevoked(id, previousHolder);
    }

    function getRelic(uint256 id) external view returns (Relic memory) {
        require(id < relics.length, "Invalid relic");
        return relics[id];
    }

    function totalRelics() external view returns (uint256) {
        return relics.length;
    }
}
