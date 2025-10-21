// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorRelocationDAO {
    address public admin;

    struct RelocationEntry {
        string district;
        string vendorType;
        string relocationClause;
        string emotionalTag;
        bool summoned;
        bool relocated;
        bool sealed;
    }

    RelocationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRelocation(string memory district, string memory vendorType, string memory relocationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RelocationEntry(district, vendorType, relocationClause, emotionalTag, true, false, false));
    }

    function confirmRelocation(uint256 index) external onlyAdmin {
        entries[index].relocated = true;
    }

    function sealRelocationEntry(uint256 index) external onlyAdmin {
        require(entries[index].relocated, "Must be relocated first");
        entries[index].sealed = true;
    }

    function getRelocationEntry(uint256 index) external view returns (RelocationEntry memory) {
        return entries[index];
    }
}
