// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string speaker;
        string platform; // "YouTube", "TikTok", "Facebook Live"
        string truthLayer; // "Whistleblower", "Civic Guardian", "Public Testimony"
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImmunity(string memory speaker, string memory platform, string memory truthLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(speaker, platform, truthLayer, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
