// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemeAuditDAO {
    address public admin;

    struct MemeEntry {
        string memeTitle;
        string platform;
        string auditFocus;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    MemeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory memeTitle, string memory platform, string memory auditFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(MemeEntry(memeTitle, platform, auditFocus, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealMemeEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getMemeEntry(uint256 index) external view returns (MemeEntry memory) {
        return entries[index];
    }
}
