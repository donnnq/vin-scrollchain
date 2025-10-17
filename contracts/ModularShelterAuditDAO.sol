// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModularShelterAuditDAO {
    address public admin;

    struct ShelterEntry {
        string shelterName;
        string purokName;
        uint unitCount;
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

    function logShelter(string memory shelterName, string memory purokName, uint unitCount, string memory emotionalTag) external onlyAdmin {
        entries.push(ShelterEntry(shelterName, purokName, unitCount, emotionalTag, true, false));
    }

    function auditShelter(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getShelter(uint256 index) external view returns (ShelterEntry memory) {
        return entries[index];
    }
}
