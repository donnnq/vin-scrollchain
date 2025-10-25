// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeLiberationToCivicResonanceProtocol {
    address public steward;

    struct ResonanceEntry {
        string medium; // "Scrollchain storytelling", "Diaspora poetry", "Civic art"
        string liberationSignal; // "Truth-telling", "Cultural dignity", "Governance awakening"
        string civicImpact; // "Public awareness", "Policy reform", "Community mobilization"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    ResonanceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateResonance(string memory medium, string memory liberationSignal, string memory civicImpact, string memory emotionalTag) external onlySteward {
        entries.push(ResonanceEntry(medium, liberationSignal, civicImpact, emotionalTag, true, false));
    }

    function sealResonanceEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getResonanceEntry(uint256 index) external view returns (ResonanceEntry memory) {
        return entries[index];
    }
}
