// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaylayanDignityKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string housingProject;
        string dignityMetric;
        string karmicImpact;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event DignityKarmaTagged(string housingProject, string dignityMetric, string karmicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory housingProject,
        string memory dignityMetric,
        string memory karmicImpact,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(housingProject, dignityMetric, karmicImpact, emotionalTag));
        emit DignityKarmaTagged(housingProject, dignityMetric, karmicImpact, emotionalTag);
    }
}
