// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorToFoodCreditSyncProtocol {
    address public steward;

    struct VendorEntry {
        string vendorName; // "Aling Nena's Sari-Sari", "Puregold Malolos"
        string barangayZone; // "Bangkal Northville 8"
        string syncStatus; // "Active", "Pending", "Revoked"
        string redemptionMode; // "e-voucher", "QR scan", "Food stamp"
        string emotionalTag;
        bool synced;
        bool sealed;
    }

    VendorEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function syncVendor(string memory vendorName, string memory barangayZone, string memory syncStatus, string memory redemptionMode, string memory emotionalTag) external onlySteward {
        entries.push(VendorEntry(vendorName, barangayZone, syncStatus, redemptionMode, emotionalTag, true, false));
    }

    function sealVendorEntry(uint256 index) external onlySteward {
        require(entries[index].synced, "Must be synced first");
        entries[index].sealed = true;
    }

    function getVendorEntry(uint256 index) external view returns (VendorEntry memory) {
        return entries[index];
    }
}
