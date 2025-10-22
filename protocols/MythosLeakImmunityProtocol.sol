// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MythosLeakImmunityProtocol {
    address public steward;

    struct ImmunityEntry {
        string leakSource; // "Podcast", "TikTok drop", "Forum thread"
        string immunitySignal; // "Unverified but protected", "Narrative resonance", "Steward reference cloaked"
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

    function grantImmunity(string memory leakSource, string memory immunitySignal, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(leakSource, immunitySignal, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlySteward {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
