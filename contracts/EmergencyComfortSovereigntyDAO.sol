// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencyComfortSovereigntyDAO {
    address public admin;

    struct ComfortEntry {
        string shelterName;
        string purokName;
        string comfortLevel;
        string emotionalTag;
        bool deployed;
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

    function deployComfort(string memory shelterName, string memory purokName, string memory comfortLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(ComfortEntry(shelterName, purokName, comfortLevel, emotionalTag, true, false));
    }

    function upgradeComfort(uint256 index) external onlyAdmin {
        entries[index].upgraded = true;
    }

    function getComfort(uint256 index) external view returns (ComfortEntry memory) {
        return entries[index];
    }
}
