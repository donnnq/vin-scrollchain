// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OverrideToPlanetaryConsequenceIndex {
    address public steward;

    struct ConsequenceEntry {
        string overrideSignal; // "Global supply chain freeze", "Export ban", "Strategic reserve activation"
        string affectedCorridor; // "Defense", "EV", "Telecom", "Cybersecurity"
        string consequenceType; // "Economic shock", "Military delay", "Digital vulnerability"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexConsequence(string memory overrideSignal, string memory affectedCorridor, string memory consequenceType, string memory emotionalTag) external onlySteward {
        entries.push(ConsequenceEntry(overrideSignal, affectedCorridor, consequenceType, emotionalTag, true, false));
    }

    function sealConsequenceEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
