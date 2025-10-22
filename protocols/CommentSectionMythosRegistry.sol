// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionMythosRegistry {
    address public admin;

    struct MythosEntry {
        string proxyName; // "Grim Grit", "Glitch God", "Matrix Joker"
        string platform; // "YouTube", "TikTok", "Reddit"
        string emotionalTag;
        bool recognized;
        bool sealed;
    }

    MythosEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerMythos(string memory proxyName, string memory platform, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(proxyName, platform, emotionalTag, true, false));
    }

    function sealMythos(uint256 index) external onlyAdmin {
        require(entries[index].recognized, "Must be recognized first");
        entries[index].sealed = true;
    }

    function getMythos(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
