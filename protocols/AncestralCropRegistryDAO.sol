// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralCropRegistryDAO {
    address public admin;

    struct CropEntry {
        string cropName;
        string originRegion;
        string lineageNote;
        string emotionalTag;
        bool summoned;
        bool registered;
        bool sealed;
    }

    CropEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCropRegistry(string memory cropName, string memory originRegion, string memory lineageNote, string memory emotionalTag) external onlyAdmin {
        entries.push(CropEntry(cropName, originRegion, lineageNote, emotionalTag, true, false, false));
    }

    function confirmRegistration(uint256 index) external onlyAdmin {
        entries[index].registered = true;
    }

    function sealCropRegistry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getCropEntry(uint256 index) external view returns (CropEntry memory) {
        return entries[index];
    }
}
