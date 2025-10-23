// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatchDelayImmunityLedger {
    address public steward;

    struct ImmunityEntry {
        string vulnerabilityID;
        uint256 daysDelayed;
        string immunityGap; // "Firewall bypass", "Zero-trust failure", "Unpatched endpoint"
        string emotionalTag;
        bool logged;
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

    function logImmunityGap(string memory vulnerabilityID, uint256 daysDelayed, string memory immunityGap, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(vulnerabilityID, daysDelayed, immunityGap, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
