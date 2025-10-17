// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokSovereigntyFellowship {
    address public admin;

    struct FellowshipEntry {
        string purokName;
        string sovereigntyTheme;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateFellowship(string memory purokName, string memory sovereigntyTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(purokName, sovereigntyTheme, emotionalTag, true, false));
    }

    function reinforceFellowship(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
