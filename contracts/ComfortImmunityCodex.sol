// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComfortImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string shelterName;
        string purokName;
        string comfortMetric;
        string emotionalTag;
        bool deployed;
        bool immune;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployComfort(string memory shelterName, string memory purokName, string memory comfortMetric, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(shelterName, purokName, comfortMetric, emotionalTag, true, false));
    }

    function markImmune(uint256 index) external onlyAdmin {
        entries[index].immune = true;
    }

    function getComfort(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
