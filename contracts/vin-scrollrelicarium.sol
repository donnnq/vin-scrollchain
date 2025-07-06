// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollRelicarium {
    struct Relic {
        string name;
        string origin;
        string effect;
        string lore;
        address holder;
        bool active;
        uint256 timestamp;
    }

    Relic[] public relics;
    mapping(string => uint256) public nameToId;
    address public immutable relicKeeper;

    event RelicForged(uint256 indexed id, string name, address holder, string origin, uint256 timestamp);
    event RelicTransferred(uint256 indexed id, address from, address to, uint256 timestamp);
    event RelicDeactivated(uint256 indexed id, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == relicKeeper, "Not the relic keeper");
        _;
    }

    constructor() {
        relicKeeper = msg.sender;
    }

    function forgeRelic(
        string calldata name,
        string calldata origin,
        string calldata effect,
        string calldata lore,
        address holder
    ) external onlyKeeper {
        require(nameToId[name] == 0, "Relic already exists");

        relics.push(Relic({
            name: name,
            origin: origin,
            effect: effect,
            lore: lore,
            holder: holder,
            active: true,
            timestamp: block.timestamp
        }));

        nameToId[name] = relics.length; // 1-based index
        emit RelicForged(relics.length - 1, name, holder, origin, block.timestamp);
    }

    function transferRelic(uint256 id, address to) external onlyKeeper {
        require(id < relics.length, "Invalid relic ID");
        require(relics[id].active, "Relic is inactive");

        address from = relics[id].holder;
        relics[id].holder = to;
        emit RelicTransferred(id, from, to, block.timestamp);
    }

    function deactivateRelic(uint256 id) external onlyKeeper {
        require(id < relics.length, "Invalid relic ID");
        relics[id].active = false;
        emit RelicDeactivated(id, block.timestamp);
    }

    function getRelic(uint256 id) external view returns (Relic memory) {
        require(id < relics.length, "Invalid relic ID");
        return relics[id];
    }

    function totalRelics() external view returns (uint256) {
        return relics.length;
    }
}
