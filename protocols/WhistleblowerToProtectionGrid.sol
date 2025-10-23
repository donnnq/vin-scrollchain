// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerToProtectionGrid {
    address public steward;

    struct ProtectionEntry {
        string whistleblowerName;
        string caseLinked; // "Flood control scandal"
        string protectionType; // "Legal shield", "Anonymity", "Witness security"
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

    function activateProtection(string memory whistleblowerName, string memory caseLinked, string memory protectionType, string memory emotionalTag) external onlySteward {
        entries.push(ProtectionEntry(whistleblowerName, caseLinked, protectionType, emotionalTag, true, false));
    }

    function sealProtectionEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
