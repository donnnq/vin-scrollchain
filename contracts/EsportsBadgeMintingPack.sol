// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsportsBadgeMintingPack {
    address public admin;

    struct BadgeEntry {
        string playerName;
        string gameTitle;
        string emotionalTag;
        bool minted;
        bool awarded;
    }

    BadgeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mintBadge(string memory playerName, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(BadgeEntry(playerName, gameTitle, emotionalTag, true, false));
    }

    function awardBadge(uint256 index) external onlyAdmin {
        entries[index].awarded = true;
    }

    function getBadge(uint256 index) external view returns (BadgeEntry memory) {
        return entries[index];
    }
}
