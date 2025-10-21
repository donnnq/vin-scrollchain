// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FenceColorRestorationIndex {
    address public admin;

    struct FenceEntry {
        string location;
        string colorScheme; // "Community-Voted", "Heritage", "Neutral Harmony"
        string emotionalTag;
        bool summoned;
        bool repainted;
        bool sealed;
    }

    FenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFenceRestoration(string memory location, string memory colorScheme, string memory emotionalTag) external onlyAdmin {
        entries.push(FenceEntry(location, colorScheme, emotionalTag, true, false, false));
    }

    function confirmRepaint(uint256 index) external onlyAdmin {
        entries[index].repainted = true;
    }

    function sealFenceEntry(uint256 index) external onlyAdmin {
        require(entries[index].repainted, "Must be repainted first");
        entries[index].sealed = true;
    }

    function getFenceEntry(uint256 index) external view returns (FenceEntry memory) {
        return entries[index];
    }
}
