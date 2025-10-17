// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetSovereigntyCodex {
    address public admin;

    struct SovereigntyEntry {
        string assetName;
        string corridor;
        string emotionalTag;
        bool protected;
        bool sovereign;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectAsset(string memory assetName, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(assetName, corridor, emotionalTag, true, false));
    }

    function markSovereign(uint256 index) external onlyAdmin {
        entries[index].sovereign = true;
    }

    function getAsset(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
