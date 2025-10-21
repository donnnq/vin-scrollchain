// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorEquityDAO {
    address public admin;

    struct EquityEntry {
        string district;
        string vendorType;
        string equityClause;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEquity(string memory district, string memory vendorType, string memory equityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EquityEntry(district, vendorType, equityClause, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealEquityEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
