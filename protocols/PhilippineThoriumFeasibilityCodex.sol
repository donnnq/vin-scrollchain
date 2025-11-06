// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhilippineThoriumFeasibilityCodex {
    address public steward;

    struct FeasibilityEntry {
        string region;
        string thoriumDepositLevel;
        string reactorReadiness;
        string emotionalTag;
    }

    FeasibilityEntry[] public codex;

    event ThoriumFeasibilityTagged(string region, string thoriumDepositLevel, string reactorReadiness, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFeasibility(
        string memory region,
        string memory thoriumDepositLevel,
        string memory reactorReadiness,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(FeasibilityEntry(region, thoriumDepositLevel, reactorReadiness, emotionalTag));
        emit ThoriumFeasibilityTagged(region, thoriumDepositLevel, reactorReadiness, emotionalTag);
    }
}
