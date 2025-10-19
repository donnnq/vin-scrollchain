// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayVendorLocatorCodex {
    address public admin;

    struct LocatorEntry {
        string vendorName;
        string barangay;
        string productType;
        string mapLink;
        string emotionalTag;
        bool summoned;
        bool published;
        bool sealed;
    }

    LocatorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLocator(string memory vendorName, string memory barangay, string memory productType, string memory mapLink, string memory emotionalTag) external onlyAdmin {
        entries.push(LocatorEntry(vendorName, barangay, productType, mapLink, emotionalTag, true, false, false));
    }

    function confirmPublication(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function sealLocatorEntry(uint256 index) external onlyAdmin {
        require(entries[index].published, "Must be published first");
        entries[index].sealed = true;
    }

    function getLocatorEntry(uint256 index) external view returns (LocatorEntry memory) {
        return entries[index];
    }
}
