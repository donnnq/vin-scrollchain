// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHarvestDAO {
    address public admin;

    struct HarvestEntry {
        string crop;
        string barangay;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    HarvestEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHarvest(string memory crop, string memory barangay, string memory emotionalTag) external onlyAdmin {
        entries.push(HarvestEntry(crop, barangay, emotionalTag, true, false, false));
    }

    function protectHarvest(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealHarvest(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getHarvestEntry(uint256 index) external view returns (HarvestEntry memory) {
        return entries[index];
    }
}
