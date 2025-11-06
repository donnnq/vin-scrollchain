// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NatureBasedSolutionFeasibilityLedger {
    address public steward;

    struct FeasibilityEntry {
        string terrainType;
        string urbanDensity;
        string NBSProtocol;
        string ecologicalKarma;
        string emotionalTag;
    }

    FeasibilityEntry[] public ledger;

    event NBSFeasibilityTagged(string terrainType, string urbanDensity, string NBSProtocol, string ecologicalKarma, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFeasibility(
        string memory terrainType,
        string memory urbanDensity,
        string memory NBSProtocol,
        string memory ecologicalKarma,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FeasibilityEntry(terrainType, urbanDensity, NBSProtocol, ecologicalKarma, emotionalTag));
        emit NBSFeasibilityTagged(terrainType, urbanDensity, NBSProtocol, ecologicalKarma, emotionalTag);
    }
}
