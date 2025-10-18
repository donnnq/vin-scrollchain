// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetFreezeAndVerificationProtocol {
    address public admin;

    struct AssetEntry {
        string assetType;
        string owner;
        string suspectedOrigin;
        string emotionalTag;
        bool frozen;
        bool verified;
        bool seized;
    }

    AssetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function freezeAsset(string memory assetType, string memory owner, string memory suspectedOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(AssetEntry(assetType, owner, suspectedOrigin, emotionalTag, true, false, false));
    }

    function verifyAsset(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function seizeAsset(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].seized = true;
    }

    function getAssetEntry(uint256 index) external view returns (AssetEntry memory) {
        return entries[index];
    }
}
