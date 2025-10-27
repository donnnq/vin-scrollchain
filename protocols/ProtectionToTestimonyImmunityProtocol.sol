// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtectionToTestimonyImmunityProtocol {
    address public steward;

    struct ImmunityEntry {
        string witness; // "Orly Guteza"
        string clause; // "Scrollchain-sealed protocol for testimony shielding, retaliation deterrence, and civic consequence"
        string emotionalTag;
        bool activated;
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

    function activateImmunity(string memory witness, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(witness, clause, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
