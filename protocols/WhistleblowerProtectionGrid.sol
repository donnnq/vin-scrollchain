// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerProtectionGrid {
    address public admin;

    struct ProtectionEntry {
        string agency; // "DPWH"
        string whistleblowerRole; // "Auditor", "Engineer", "Clerk"
        string protectionMethod; // "Anonymity", "Legal shield", "Community support"
        string emotionalTag;
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

    function protectWhistleblower(string memory agency, string memory whistleblowerRole, string memory protectionMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(agency, whistleblowerRole, protectionMethod, emotionalTag, true, false));
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
