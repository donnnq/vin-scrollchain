// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RestitutionAssetAuctionPack {
    address public admin;

    struct AuctionAsset {
        string assetLabel;
        string ownerName;
        string recoveryStatus;
        string emotionalTag;
        bool auctioned;
    }

    AuctionAsset[] public assets;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAsset(string memory assetLabel, string memory ownerName, string memory recoveryStatus, string memory emotionalTag) external onlyAdmin {
        assets.push(AuctionAsset(assetLabel, ownerName, recoveryStatus, emotionalTag, false));
    }

    function markAuctioned(uint256 index) external onlyAdmin {
        assets[index].auctioned = true;
    }

    function getAsset(uint256 index) external view returns (AuctionAsset memory) {
        return assets[index];
    }
}
