// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthFarmerDAO {
    address public admin;

    struct FarmerEntry {
        string name;
        string purokZone;
        string trainingLayer; // "Animal Care", "Crop Rotation", "Compost Loop", "Aquaponics"
        string emotionalTag;
        bool summoned;
        bool trained;
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

    function summonFarmer(string memory name, string memory purokZone, string memory trainingLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(FarmerEntry(name, purokZone, trainingLayer, emotionalTag, true, false, false));
    }

    function confirmTraining(uint256 index) external onlyAdmin {
        entries[index].trained = true;
    }

    function sealFarmerEntry(uint256 index) external onlyAdmin {
        require(entries[index].trained, "Must be trained first");
        entries[index].sealed = true;
    }

    function getFarmerEntry(uint256 index) external view returns (FarmerEntry memory) {
        return entries[index];
    }
}
