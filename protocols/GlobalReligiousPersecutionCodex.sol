// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalReligiousPersecutionCodex {
    address public admin;

    struct PersecutionEntry {
        string region;
        string faithGroup;
        string persecutionMethod;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool documented;
        bool sealed;
    }

    PersecutionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPersecution(string memory region, string memory faithGroup, string memory persecutionMethod, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(PersecutionEntry(region, faithGroup, persecutionMethod, codexClause, emotionalTag, true, false, false));
    }

    function confirmDocumentation(uint256 index) external onlyAdmin {
        entries[index].documented = true;
    }

    function sealPersecutionEntry(uint256 index) external onlyAdmin {
        require(entries[index].documented, "Must be documented first");
        entries[index].sealed = true;
    }

    function getPersecutionEntry(uint256 index) external view returns (PersecutionEntry memory) {
        return entries[index];
    }
}
