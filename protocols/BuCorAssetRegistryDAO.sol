// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BuCorAssetRegistryDAO {
    address public admin;

    struct AssetEntry {
        string assetName;
        string location;
        string usageType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    AssetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAsset(string memory assetName, string memory location, string memory usageType, string memory emotionalTag) external onlyAdmin {
        entries.push(AssetEntry(assetName, location, usageType, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealAssetEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getAssetEntry(uint256 index) external view returns (AssetEntry memory) {
        return entries[index];
    }
}
