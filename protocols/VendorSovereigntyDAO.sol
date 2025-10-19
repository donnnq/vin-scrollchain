// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorSovereigntyDAO {
    address public admin;

    struct VendorEntry {
        string vendorName;
        string barangay;
        string productType;
        string emotionalTag;
        bool summoned;
        bool assigned;
        bool sealed;
    }

    VendorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonVendor(string memory vendorName, string memory barangay, string memory productType, string memory emotionalTag) external onlyAdmin {
        entries.push(VendorEntry(vendorName, barangay, productType, emotionalTag, true, false, false));
    }

    function confirmAssignment(uint256 index) external onlyAdmin {
        entries[index].assigned = true;
    }

    function sealVendorEntry(uint256 index) external onlyAdmin {
        require(entries[index].assigned, "Must be assigned first");
        entries[index].sealed = true;
    }

    function getVendorEntry(uint256 index) external view returns (VendorEntry memory) {
        return entries[index];
    }
}
