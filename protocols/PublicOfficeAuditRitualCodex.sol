// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicOfficeAuditRitualCodex {
    address public admin;

    struct AuditRitual {
        string officeName;
        string auditType;
        string ritualFrequency;
        string emotionalTag;
        bool summoned;
        bool performed;
        bool sealed;
    }

    AuditRitual[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAuditRitual(string memory officeName, string memory auditType, string memory ritualFrequency, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditRitual(officeName, auditType, ritualFrequency, emotionalTag, true, false, false));
    }

    function performAudit(uint256 index) external onlyAdmin {
        entries[index].performed = true;
    }

    function sealAuditRitual(uint256 index) external onlyAdmin {
        require(entries[index].performed, "Must be performed first");
        entries[index].sealed = true;
    }

    function getAuditRitual(uint256 index) external view returns (AuditRitual memory) {
        return entries[index];
    }
}
