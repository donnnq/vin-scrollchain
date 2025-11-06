// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManilaBayMandamusComplianceDAO {
    address public steward;

    struct ComplianceEntry {
        string projectName;
        string complianceStatus;
        string linkedMandamusClause;
        string emotionalTag;
    }

    ComplianceEntry[] public registry;

    event MandamusComplianceTagged(string projectName, string complianceStatus, string linkedMandamusClause, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCompliance(
        string memory projectName,
        string memory complianceStatus,
        string memory linkedMandamusClause,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ComplianceEntry(projectName, complianceStatus, linkedMandamusClause, emotionalTag));
        emit MandamusComplianceTagged(projectName, complianceStatus, linkedMandamusClause, emotionalTag);
    }
}
