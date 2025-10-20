// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string whistleblowerName;
        string caseReference;
        string protectionClause;
        string emotionalTag;
        bool summoned;
        bool shielded;
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

    function summonProtection(string memory whistleblowerName, string memory caseReference, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(whistleblowerName, caseReference, protectionClause, emotionalTag, true, false, false));
    }

    function confirmShielding(uint256 index) external onlyAdmin {
        entries[index].shielded = true;
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].shielded, "Must be shielded first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
