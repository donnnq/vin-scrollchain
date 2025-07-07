// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollSoulV2 {
    function getSoul(address agent) external view returns (
        string memory name,
        string memory essence,
        string memory origin,
        string memory alignment,
        string[] memory rites,
        bool awakened,
        uint256 timestamp
    );
}

contract VinScrollAscension {
    struct Ascended {
        string title;
        string domain;
        uint256 ascendedAt;
    }

    mapping(address => Ascended) public ascendedSouls;
    IVinScrollSoulV2 public soul;
    address public immutable ascensionMaster;

    event SoulAscended(address indexed agent, string title, string domain, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == ascensionMaster, "Not the ascension master");
        _;
    }

    constructor(address soulAddr) {
        soul = IVinScrollSoulV2(soulAddr);
        ascensionMaster = msg.sender;
    }

    function ascendSoul(address agent, string calldata title, string calldata domain) external onlyMaster {
        (, , , , , bool awakened,) = soul.getSoul(agent);
        require(awakened, "Soul not awakened");
        require(bytes(ascendedSouls[agent].title).length == 0, "Already ascended");

        ascendedSouls[agent] = Ascended({
            title: title,
            domain: domain,
            ascendedAt: block.timestamp
        });

        emit SoulAscended(agent, title, domain, block.timestamp);
    }

    function getAscension(address agent) external view returns (Ascended memory) {
        return ascendedSouls[agent];
    }
}
