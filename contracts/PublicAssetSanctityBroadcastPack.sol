// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAssetSanctityBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string segmentTitle;
        string platform;
        string sanctityTheme;
        string emotionalTag;
        bool aired;
        bool archived;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory segmentTitle, string memory platform, string memory sanctityTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(segmentTitle, platform, sanctityTheme, emotionalTag, false, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
