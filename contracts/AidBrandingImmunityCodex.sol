// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AidBrandingImmunityCodex {
    address public admin;

    struct BrandingEntry {
        string aidType;
        string department;
        string emotionalTag;
        bool logoOnly;
        bool enforced;
    }

    BrandingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAid(string memory aidType, string memory department, string memory emotionalTag) external onlyAdmin {
        entries.push(BrandingEntry(aidType, department, emotionalTag, true, false));
    }

    function enforceLogoOnly(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function getAid(uint256 index) external view returns (BrandingEntry memory) {
        return entries[index];
    }
}
