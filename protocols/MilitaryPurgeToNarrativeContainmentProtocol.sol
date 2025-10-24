// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MilitaryPurgeToNarrativeContainmentProtocol {
    address public steward;

    struct PurgeEntry {
        string regime; // "Xi Jinping"
        string triggerEvent; // "Fourth Plenum purge"
        string narrativeSignal; // "Loyalty crisis", "Command fracture"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    PurgeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexPurge(string memory regime, string memory triggerEvent, string memory narrativeSignal, string memory emotionalTag) external onlySteward {
        entries.push(PurgeEntry(regime, triggerEvent, narrativeSignal, emotionalTag, true, false));
    }

    function sealPurgeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getPurgeEntry(uint256 index) external view returns (PurgeEntry memory) {
        return entries[index];
    }
}
