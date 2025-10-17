// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryFamilyProtectionFellowship {
    address public admin;

    struct FellowshipEntry {
        string protectionTheme;
        string fellowshipAction;
        string emotionalTag;
        bool summoned;
        bool completed;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFellowship(string memory protectionTheme, string memory fellowshipAction, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(protectionTheme, fellowshipAction, emotionalTag, true, false));
    }

    function completeFellowship(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getFellowshipEntry(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
