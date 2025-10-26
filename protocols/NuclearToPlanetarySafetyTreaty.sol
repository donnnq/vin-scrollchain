// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NuclearToPlanetarySafetyTreaty {
    address public steward;

    struct TreatyEntry {
        string facility; // "BNPP"
        string safetyClause; // "IAEA compliance, seismic risk mitigation, emergency protocols"
        string planetaryImpact; // "Low-carbon transition, energy sovereignty, climate resilience"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory facility, string memory safetyClause, string memory planetaryImpact, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(facility, safetyClause, planetaryImpact, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
