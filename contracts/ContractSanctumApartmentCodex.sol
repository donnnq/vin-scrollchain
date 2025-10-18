// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractSanctumApartmentCodex {
    address public admin;

    struct ApartmentEntry {
        string apartmentName;
        string assignedTo;
        string emotionalTag;
        bool summoned;
        bool occupied;
    }

    ApartmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonApartment(string memory apartmentName, string memory assignedTo, string memory emotionalTag) external onlyAdmin {
        entries.push(ApartmentEntry(apartmentName, assignedTo, emotionalTag, true, false));
    }

    function occupyApartment(uint256 index) external onlyAdmin {
        entries[index].occupied = true;
    }

    function getApartmentEntry(uint256 index) external view returns (ApartmentEntry memory) {
        return entries[index];
    }
}
