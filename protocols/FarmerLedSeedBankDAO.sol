// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerLedSeedBankDAO {
    address public admin;

    struct SeedBankEntry {
        string seedName;
        string originRegion;
        string preservationMethod;
        string emotionalTag;
        bool summoned;
        bool stored;
        bool sealed;
    }

    SeedBankEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSeedBankEntry(string memory seedName, string memory originRegion, string memory preservationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(SeedBankEntry(seedName, originRegion, preservationMethod, emotionalTag, true, false, false));
    }

    function confirmStorage(uint256 index) external onlyAdmin {
        entries[index].stored = true;
    }

    function sealSeedBankEntry(uint256 index) external onlyAdmin {
        require(entries[index].stored, "Must be stored first");
        entries[index].sealed = true;
    }

    function getSeedBankEntry(uint256 index) external view returns (SeedBankEntry memory) {
        return entries[index];
    }
}
