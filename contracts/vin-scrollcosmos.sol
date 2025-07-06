// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollCosmos {
    enum EntityType { Soul, Scroll, Sanctum, Relic, Sigil }

    struct Link {
        EntityType fromType;
        address from;
        EntityType toType;
        address to;
        string relation; // e.g. "Guards", "BoundTo", "ForgedFrom", "DwellsIn"
        uint256 timestamp;
    }

    Link[] public links;
    mapping(address => uint256[]) public entityLinks;
    address public immutable cosmosKeeper;

    event LinkForged(
        uint256 indexed id,
        EntityType fromType,
        address from,
        EntityType toType,
        address to,
        string relation,
        uint256 timestamp
    );

    modifier onlyKeeper() {
        require(msg.sender == cosmosKeeper, "Not the cosmos keeper");
        _;
    }

    constructor() {
        cosmosKeeper = msg.sender;
    }

    function forgeLink(
        EntityType fromType,
        address from,
        EntityType toType,
        address to,
        string calldata relation
    ) external onlyKeeper {
        links.push(Link({
            fromType: fromType,
            from: from,
            toType: toType,
            to: to,
            relation: relation,
            timestamp: block.timestamp
        }));

        entityLinks[from].push(links.length - 1);
        entityLinks[to].push(links.length - 1);

        emit LinkForged(links.length - 1, fromType, from, toType, to, relation, block.timestamp);
    }

    function getLinks(address entity) external view returns (Link[] memory) {
        uint256[] memory ids = entityLinks[entity];
        Link[] memory result = new Link[](ids.length);
        for (uint256 i = 0; i < ids.length; i++) {
            result[i] = links[ids[i]];
        }
        return result;
    }

    function totalLinks() external view returns (uint256) {
        return links.length;
    }
}
