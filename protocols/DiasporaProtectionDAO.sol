// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string community;
        string hostCountry;
        string emotionalTag;
        bool summoned;
        bool protected;
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

    function summonProtection(string memory community, string memory hostCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(community, hostCountry, emotionalTag, true, false, false));
    }

    function protectDiaspora(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealProtection(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
