// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobilePortingGuildPack {
    address public admin;

    struct GuildEntry {
        string devName;
        string gameTitle;
        string emotionalTag;
        bool joined;
        bool certified;
    }

    GuildEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function joinGuild(string memory devName, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(GuildEntry(devName, gameTitle, emotionalTag, true, false));
    }

    function certifyGuildMember(uint256 index) external onlyAdmin {
        entries[index].certified = true;
    }

    function getGuildEntry(uint256 index) external view returns (GuildEntry memory) {
        return entries[index];
    }
}
