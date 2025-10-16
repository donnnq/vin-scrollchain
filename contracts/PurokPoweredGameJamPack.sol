// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredGameJamPack {
    address public admin;

    struct JamEntry {
        string teamName;
        string purokLabel;
        string theme;
        string emotionalTag;
        bool submitted;
        bool awarded;
    }

    JamEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitJam(string memory teamName, string memory purokLabel, string memory theme, string memory emotionalTag) external onlyAdmin {
        entries.push(JamEntry(teamName, purokLabel, theme, emotionalTag, true, false));
    }

    function awardJam(uint256 index) external onlyAdmin {
        entries[index].awarded = true;
    }

    function getJam(uint256 index) external view returns (JamEntry memory) {
        return entries[index];
    }
}
