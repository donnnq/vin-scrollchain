// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokComfortFellowship {
    address public admin;

    struct ComfortEntry {
        string purokName;
        string comfortStandard;
        string emotionalTag;
        bool initiated;
        bool upgraded;
    }

    ComfortEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateComfort(string memory purokName, string memory comfortStandard, string memory emotionalTag) external onlyAdmin {
        entries.push(ComfortEntry(purokName, comfortStandard, emotionalTag, true, false));
    }

    function upgradeComfort(uint256 index) external onlyAdmin {
        entries[index].upgraded = true;
    }

    function getComfort(uint256 index) external view returns (ComfortEntry memory) {
        return entries[index];
    }
}
