// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShelterEquityCodex {
    address public admin;

    struct ShelterEntry {
        string purokName;
        string shelterType;
        string emotionalTag;
        bool deployed;
        bool audited;
    }

    ShelterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logShelter(string memory purokName, string memory shelterType, string memory emotionalTag) external onlyAdmin {
        entries.push(ShelterEntry(purokName, shelterType, emotionalTag, true, false));
    }

    function auditShelter(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getShelter(uint256 index) external view returns (ShelterEntry memory) {
        return entries[index];
    }
}
