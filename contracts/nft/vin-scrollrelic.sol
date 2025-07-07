// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollRelic {
    struct Relic {
        string name;
        string power;
        string condition;
        bool active;
    }

    Relic[] public relics;
    address public immutable boss;

    event RelicForged(uint256 indexed id, string name, string power, string condition);
    event RelicActivated(uint256 indexed id, address indexed by);
    event RelicDenied(uint256 indexed id, address indexed by, string reason);

    modifier onlyBoss() {
        require(msg.sender == boss, "Not the scrollboss");
        _;
    }

    constructor() {
        boss = msg.sender;
    }

    function forgeRelic(string calldata name, string calldata power, string calldata condition) external onlyBoss {
        relics.push(Relic({
            name: name,
            power: power,
            condition: condition,
            active: false
        }));

        emit RelicForged(relics.length - 1, name, power, condition);
    }

    function activateRelic(uint256 id, string calldata reason) external onlyBoss {
        require(id < relics.length, "Invalid relic");
        require(!relics[id].active, "Already active");

        relics[id].active = true;
        emit RelicActivated(id, msg.sender);
    }

    function denyRelic(uint256 id, string calldata reason) external onlyBoss {
        require(id < relics.length, "Invalid relic");
        emit RelicDenied(id, msg.sender, reason);
    }

    function getRelic(uint256 id) external view returns (Relic memory) {
        require(id < relics.length, "Invalid relic");
        return relics[id];
    }

    function totalRelics() external view returns (uint256) {
        return relics.length;
    }
}
