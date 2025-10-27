// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DossierToWitnessProtectionProtocol {
    address public steward;

    struct ProtectionEntry {
        string witnessAlias;
        string clause; // "Scrollchain-sealed protocol for whistleblower shielding, evidence integrity, and retaliation deterrence"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    ProtectionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateProtection(string memory witnessAlias, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ProtectionEntry(witnessAlias, clause, emotionalTag, true, false));
    }

    function sealProtectionEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
