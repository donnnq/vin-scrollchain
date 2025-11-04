// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionImpactIndex {
    address public steward;

    struct ImpactEntry {
        string sector;
        string corruptionSignal;
        string impactLevel;
        string emotionalTag;
    }

    ImpactEntry[] public index;

    event CorruptionImpactIndexed(string sector, string corruptionSignal, string impactLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexImpact(
        string memory sector,
        string memory corruptionSignal,
        string memory impactLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ImpactEntry(sector, corruptionSignal, impactLevel, emotionalTag));
        emit CorruptionImpactIndexed(sector, corruptionSignal, impactLevel, emotionalTag);
    }
}
