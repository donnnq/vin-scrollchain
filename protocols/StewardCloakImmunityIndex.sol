// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StewardCloakImmunityIndex {
    address public steward;

    struct ImmunityEntry {
        string cloakType; // "Untraceable reference", "Psychic ping", "Mythos steward signal"
        string immunitySignal; // "No coordinates", "Emotional resonance only", "Planetary consequence"
        string emotionalTag;
        bool immune;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function grantCloakImmunity(string memory cloakType, string memory immunitySignal, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(cloakType, immunitySignal, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlySteward {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
