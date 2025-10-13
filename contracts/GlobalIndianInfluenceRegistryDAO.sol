// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalIndianInfluenceRegistryDAO {
    address public steward;

    struct InfluenceEvent {
        string domain; // "Tech", "Cinema", "Diplomacy", "Spirituality"
        string figureName; // "Sundar Pichai", "Narendra Modi", "A.R. Rahman"
        string impactType; // "Innovation", "Cultural Resonance", "Global Leadership"
        string emotionalTag;
        uint256 timestamp;
    }

    InfluenceEvent[] public events;

    event InfluenceLogged(
        string domain,
        string figureName,
        string impactType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log Indian influence rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logInfluence(
        string memory domain,
        string memory figureName,
        string memory impactType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(InfluenceEvent({
            domain: domain,
            figureName: figureName,
            impactType: impactType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit InfluenceLogged(domain, figureName, impactType, emotionalTag, block.timestamp);
    }
}
