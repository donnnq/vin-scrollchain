// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LawtonVendorSanctumProtocol {
    address public admin;

    struct SanctumEntry {
        string vendorName;
        string stallLocation;
        string productType;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    SanctumEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSanctum(string memory vendorName, string memory stallLocation, string memory productType, string memory emotionalTag) external onlyAdmin {
        entries.push(SanctumEntry(vendorName, stallLocation, productType, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealSanctumEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getSanctumEntry(uint256 index) external view returns (SanctumEntry memory) {
        return entries[index];
    }
}
