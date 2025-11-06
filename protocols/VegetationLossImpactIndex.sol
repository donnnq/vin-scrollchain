// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VegetationLossImpactIndex {
    address public steward;

    struct ImpactEntry {
        string location;
        string vegetationType;
        string hydrologicalEffect;
        string erosionSignal;
        string emotionalTag;
    }

    ImpactEntry[] public index;

    event VegetationLossTagged(string location, string vegetationType, string hydrologicalEffect, string erosionSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagVegetationLoss(
        string memory location,
        string memory vegetationType,
        string memory hydrologicalEffect,
        string memory erosionSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ImpactEntry(location, vegetationType, hydrologicalEffect, erosionSignal, emotionalTag));
        emit VegetationLossTagged(location, vegetationType, hydrologicalEffect, erosionSignal, emotionalTag);
    }
}
