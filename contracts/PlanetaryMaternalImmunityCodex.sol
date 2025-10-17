// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryMaternalImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string maternalVoice;
        string protectionTheme;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImmunity(string memory maternalVoice, string memory protectionTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(maternalVoice, protectionTheme, emotionalTag, true, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
