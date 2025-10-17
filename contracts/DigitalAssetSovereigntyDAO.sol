// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalAssetSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string assetType;
        string jurisdiction;
        string emotionalTag;
        bool protected;
        bool reinforced;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectAsset(string memory assetType, string memory jurisdiction, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(assetType, jurisdiction, emotionalTag, true, false));
    }

    function reinforceAsset(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getAsset(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
