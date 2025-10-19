// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorLaneAllocationCodex {
    address public admin;

    struct VendorLaneEntry {
        string laneName;
        string vendorType;
        string operatingHours;
        string emotionalTag;
        bool summoned;
        bool assigned;
        bool sealed;
    }

    VendorLaneEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonVendorLane(string memory laneName, string memory vendorType, string memory operatingHours, string memory emotionalTag) external onlyAdmin {
        entries.push(VendorLaneEntry(laneName, vendorType, operatingHours, emotionalTag, true, false, false));
    }

    function confirmAssignment(uint256 index) external onlyAdmin {
        entries[index].assigned = true;
    }

    function sealVendorLaneEntry(uint256 index) external onlyAdmin {
        require(entries[index].assigned, "Must be assigned first");
        entries[index].sealed = true;
    }

    function getVendorLaneEntry(uint256 index) external view returns (VendorLaneEntry memory) {
        return entries[index];
    }
}
