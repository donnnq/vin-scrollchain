// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VINVIN's Crosschain Obfuscation Registry
/// @notice Tracks structured and multi-hop laundering flows across blockchain protocols

contract vin_scrollCrosschainObfuscationRegistry {
    struct LaunderTrail {
        address originChain;
        address[] pathChains;
        string technique; // "structured" or "multi-hop"
        string taggedEntity;
        bool flaggedByElliptic;
        uint256 timestamp;
    }

    mapping(bytes32 => LaunderTrail) public registry;

    event ObfuscationTrailLogged(
        bytes32 indexed trailId,
        address indexed originChain,
        address[] pathChains,
        string technique,
        string taggedEntity,
        bool flaggedByElliptic,
        uint256 timestamp
    );

    function logTrail(
        address originChain,
        address[] calldata pathChains,
        string calldata technique,
        string calldata taggedEntity,
        bool flaggedByElliptic
    ) external {
        bytes32 trailId = keccak256(
            abi.encode(originChain, pathChains, technique, taggedEntity, block.timestamp)
        );
        registry[trailId] = LaunderTrail(
            originChain,
            pathChains,
            technique,
            taggedEntity,
            flaggedByElliptic,
            block.timestamp
        );
        emit ObfuscationTrailLogged(
            trailId,
            originChain,
            pathChains,
            technique,
            taggedEntity,
            flaggedByElliptic,
            block.timestamp
        );
    }

    function getTrail(bytes32 trailId) external view returns (LaunderTrail memory) {
        return registry[trailId];
    }
}
