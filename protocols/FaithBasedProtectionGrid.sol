// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithBasedProtectionGrid {
    address public steward;

    struct ProtectionEntry {
        string region; // "Nigeria"
        string faithGroup; // "Christian communities"
        string protectionMethod; // "Scrollchain audit, international pressure, humanitarian aid"
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

    function activateProtection(string memory region, string memory faithGroup, string memory protectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(ProtectionEntry(region, faithGroup, protectionMethod, emotionalTag, true, false));
    }

    function sealProtectionEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
