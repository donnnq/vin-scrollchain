// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquidityDepthMuseumRegistry {
    address public steward;

    struct LiquidityArtifact {
        string assetName;
        string corridor;
        uint256 liquidityVolume;
        string emotionalTag;
    }

    LiquidityArtifact[] public registry;

    event LiquidityArchived(string assetName, string corridor, uint256 liquidityVolume, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveLiquidity(
        string memory assetName,
        string memory corridor,
        uint256 liquidityVolume,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LiquidityArtifact(assetName, corridor, liquidityVolume, emotionalTag));
        emit LiquidityArchived(assetName, corridor, liquidityVolume, emotionalTag);
    }
}
