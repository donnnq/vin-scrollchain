// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RestorationGuildSovereigntyCodex {
    address public admin;

    struct GuildEntry {
        string guildName;
        string region;
        string specialization;
        string emotionalTag;
        bool summoned;
        bool recognized;
        bool sealed;
    }

    GuildEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGuild(string memory guildName, string memory region, string memory specialization, string memory emotionalTag) external onlyAdmin {
        entries.push(GuildEntry(guildName, region, specialization, emotionalTag, true, false, false));
    }

    function confirmRecognition(uint256 index) external onlyAdmin {
        entries[index].recognized = true;
    }

    function sealGuildEntry(uint256 index) external onlyAdmin {
        require(entries[index].recognized, "Must be recognized first");
        entries[index].sealed = true;
    }

    function getGuildEntry(uint256 index) external view returns (GuildEntry memory) {
        return entries[index];
    }
}
