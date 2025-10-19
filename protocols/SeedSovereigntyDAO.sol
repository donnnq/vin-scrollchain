// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SeedSovereigntyDAO {
    address public admin;

    struct SeedEntry {
        string cropType;
        string seedSource;
        string protectionLevel;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    SeedEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSeedProtection(string memory cropType, string memory seedSource, string memory protectionLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(SeedEntry(cropType, seedSource, protectionLevel, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealSeedProtection(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSeedEntry(uint256 index) external view returns (SeedEntry memory) {
        return entries[index];
    }
}
