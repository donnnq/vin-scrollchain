// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetDeclarationFellowship {
    address public admin;

    struct DeclarationEntry {
        string officialName;
        string assetType;
        string emotionalTag;
        bool declared;
        bool verified;
    }

    DeclarationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function declareAsset(string memory officialName, string memory assetType, string memory emotionalTag) external onlyAdmin {
        entries.push(DeclarationEntry(officialName, assetType, emotionalTag, true, false));
    }

    function verifyDeclaration(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getDeclaration(uint256 index) external view returns (DeclarationEntry memory) {
        return entries[index];
    }
}
