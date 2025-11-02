// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ETFDrainKarmaMuseum {
    address public steward;

    struct DrainArtifact {
        string asset;
        string corridor;
        uint256 outflowAmount;
        string emotionalTag;
    }

    DrainArtifact[] public registry;

    event DrainArchived(string asset, string corridor, uint256 outflowAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveDrain(
        string memory asset,
        string memory corridor,
        uint256 outflowAmount,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DrainArtifact(asset, corridor, outflowAmount, emotionalTag));
        emit DrainArchived(asset, corridor, outflowAmount, emotionalTag);
    }
}
