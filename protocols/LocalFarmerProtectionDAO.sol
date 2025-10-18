// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalFarmerProtectionDAO {
    address public admin;

    struct FarmerEntry {
        string name;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    FarmerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFarmer(string memory name, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(FarmerEntry(name, region, emotionalTag, true, false, false));
    }

    function protectFarmer(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealProtection(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getFarmerEntry(uint256 index) external view returns (FarmerEntry memory) {
        return entries[index];
    }
}
