// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KarmicAssetReversalDAO {
    address public admin;

    struct AssetEntry {
        string assetName;
        string origin;
        string emotionalTag;
        bool summoned;
        bool frozen;
        bool reversed;
    }

    AssetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAsset(string memory assetName, string memory origin, string memory emotionalTag) external onlyAdmin {
        entries.push(AssetEntry(assetName, origin, emotionalTag, true, false, false));
    }

    function freezeAsset(uint256 index) external onlyAdmin {
        entries[index].frozen = true;
    }

    function reverseAsset(uint256 index) external onlyAdmin {
        require(entries[index].frozen, "Must be frozen first");
        entries[index].reversed = true;
    }

    function getAssetEntry(uint256 index) external view returns (AssetEntry memory) {
        return entries[index];
    }
}
