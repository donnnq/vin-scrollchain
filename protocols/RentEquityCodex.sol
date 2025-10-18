// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RentEquityCodex {
    address public admin;

    struct LeaseEntry {
        string tenantName;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool ratified;
    }

    LeaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLease(string memory tenantName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(LeaseEntry(tenantName, region, emotionalTag, true, false, false));
    }

    function protectLease(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function ratifyLease(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].ratified = true;
    }

    function getLeaseEntry(uint256 index) external view returns (LeaseEntry memory) {
        return entries[index];
    }
}
