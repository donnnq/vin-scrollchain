// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string country;
        string faithGroup;
        string protectionClause;
        string emotionalTag;
        bool summoned;
        bool defended;
        bool sealed;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory country, string memory faithGroup, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(country, faithGroup, protectionClause, emotionalTag, true, false, false));
    }

    function confirmDefense(uint256 index) external onlyAdmin {
        entries[index].defended = true;
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].defended, "Must be defended first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
