// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CompanyBarracksAuditDAO {
    address public steward;

    struct AuditEntry {
        string companyName;
        string timestamp;
        string auditDimension;
        string result;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event BarracksAudited(string companyName, string timestamp, string auditDimension, string result, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditBarracks(
        string memory companyName,
        string memory timestamp,
        string memory auditDimension,
        string memory result,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(companyName, timestamp, auditDimension, result, emotionalTag));
        emit BarracksAudited(companyName, timestamp, auditDimension, result, emotionalTag);
    }
}
