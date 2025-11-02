// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EthereumETFDrainTreaty {
    address public steward;

    struct DrainClause {
        string corridor;
        string drainSource;
        string impactLevel;
        string emotionalTag;
    }

    DrainClause[] public treatyLog;

    event ETFDrainTagged(string corridor, string drainSource, string impactLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagDrain(
        string memory corridor,
        string memory drainSource,
        string memory impactLevel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DrainClause(corridor, drainSource, impactLevel, emotionalTag));
        emit ETFDrainTagged(corridor, drainSource, impactLevel, emotionalTag);
    }
}
