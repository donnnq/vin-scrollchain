// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhishingSignalImmunityProtocol {
    address public steward;

    struct ImmunityEntry {
        string phishingVector; // "OAuth token bait", "Fake login page", "Malicious app prompt"
        string immunitySignal; // "User education", "Link scanning", "Credential isolation"
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

    function grantImmunity(string memory phishingVector, string memory immunitySignal, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(phishingVector, immunitySignal, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlySteward {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
