// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MidnightAppointmentAuditDAO {
    address public admin;

    struct AppointmentEntry {
        string agency;
        string appointeeBatch; // "July 2025", "Pre-Retirement Surge"
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    AppointmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory agency, string memory appointeeBatch, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AppointmentEntry(agency, appointeeBatch, auditClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealAppointmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getAppointmentEntry(uint256 index) external view returns (AppointmentEntry memory) {
        return entries[index];
    }
}
