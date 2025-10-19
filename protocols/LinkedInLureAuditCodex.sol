// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LinkedInLureAuditCodex {
    address public admin;

    struct LureEntry {
        string recruiterAlias;
        string platform;
        string lureMethod;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    LureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLure(string memory recruiterAlias, string memory platform, string memory lureMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(LureEntry(recruiterAlias, platform, lureMethod, emotionalTag, true, false, false));
    }

    function auditLure(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealLure(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getLureEntry(uint256 index) external view returns (LureEntry memory) {
        return entries[index];
    }
}
