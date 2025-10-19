// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerSovereigntyCodex {
    address public admin;

    struct FarmerEntry {
        string farmerName;
        string region;
        string supportType;
        string emotionalTag;
        bool summoned;
        bool supported;
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

    function summonSupport(string memory farmerName, string memory region, string memory supportType, string memory emotionalTag) external onlyAdmin {
        entries.push(FarmerEntry(farmerName, region, supportType, emotionalTag, true, false, false));
    }

    function confirmSupport(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function sealFarmerEntry(uint256 index) external onlyAdmin {
        require(entries[index].supported, "Must be supported first");
        entries[index].sealed = true;
    }

    function getFarmerEntry(uint256 index) external view returns (FarmerEntry memory) {
        return entries[index];
    }
}
