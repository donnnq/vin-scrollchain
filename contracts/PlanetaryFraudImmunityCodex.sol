// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryFraudImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string country;
        string fraudType;
        string emotionalTag;
        bool deployed;
        bool reinforced;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployImmunity(string memory country, string memory fraudType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(country, fraudType, emotionalTag, true, false));
    }

    function reinforceImmunity(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
