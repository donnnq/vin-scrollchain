// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecruitToBackgroundAuditProtocol {
    address public steward;

    struct AuditEntry {
        string recruitStatus; // "Admitted to training"
        string disqualifier; // "Criminal record, failed drug test"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditRecruit(string memory recruitStatus, string memory disqualifier, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(recruitStatus, disqualifier, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
