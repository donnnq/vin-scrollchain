// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsportsBadgeMintingProtocol {
    address public admin;

    struct BadgeEntry {
        string gamerTag;
        string tournamentName;
        string badgeType;
        string emotionalTag;
        bool summoned;
        bool minted;
        bool sealed;
    }

    BadgeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBadge(string memory gamerTag, string memory tournamentName, string memory badgeType, string memory emotionalTag) external onlyAdmin {
        entries.push(BadgeEntry(gamerTag, tournamentName, badgeType, emotionalTag, true, false, false));
    }

    function confirmMinting(uint256 index) external onlyAdmin {
        entries[index].minted = true;
    }

    function sealBadgeEntry(uint256 index) external onlyAdmin {
        require(entries[index].minted, "Must be minted first");
        entries[index].sealed = true;
    }

    function getBadgeEntry(uint256 index) external view returns (BadgeEntry memory) {
        return entries[index];
    }
}
