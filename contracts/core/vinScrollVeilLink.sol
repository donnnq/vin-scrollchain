// SPDX-License-Identifier: Mythstream-Vault
pragma solidity ^0.8.30;

/// @title vinScrollVeilLink
/// @notice Tags symbolic identity veils to project scroll entries
/// @author VINVIN

contract vinScrollVeilLink {
    mapping(uint256 => string) public veilOf;
    mapping(address => string[]) public taggedEntities;

    event VeilLinked(uint256 indexed scrollId, string veilTag);
    event EntityTagged(address indexed entity, string tag);

    function linkVeil(uint256 scrollId, string calldata veilTag) external {
        veilOf[scrollId] = veilTag;
        emit VeilLinked(scrollId, veilTag);
    }

    function tagEntity(address entity, string calldata tag) external {
        taggedEntities[entity].push(tag);
        emit EntityTagged(entity, tag);
    }

    function getEntityTags(address entity) external view returns (string[] memory) {
        return taggedEntities[entity];
    }

    function getVeil(uint256 scrollId) external view returns (string memory) {
        return veilOf[scrollId];
    }
}
