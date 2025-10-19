// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanVendorSanctumProtocol {
    address public admin;

    struct StallEntry {
        string location;
        string designType;
        string vendorCategory;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    StallEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStall(string memory location, string memory designType, string memory vendorCategory, string memory emotionalTag) external onlyAdmin {
        entries.push(StallEntry(location, designType, vendorCategory, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealStallEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getStallEntry(uint256 index) external view returns (StallEntry memory) {
        return entries[index];
    }
}
