// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCivicImmunityFellowship {
    address public admin;

    struct ImmunityEntry {
        string civicGroup;
        string immunityProtocol;
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

    function summonImmunity(string memory civicGroup, string memory immunityProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(civicGroup, immunityProtocol, emotionalTag, true, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
