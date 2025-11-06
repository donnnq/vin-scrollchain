// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductCredibilityAuditLedger {
    address public steward;

    struct AuditEntry {
        string productType;
        string originCountry;
        string safetyRecord;
        string recallHistory;
        string emotionalTag;
    }

    AuditEntry[] public ledger;

    event ProductCredibilityAudited(string productType, string originCountry, string safetyRecord, string recallHistory, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditProduct(
        string memory productType,
        string memory originCountry,
        string memory safetyRecord,
        string memory recallHistory,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(AuditEntry(productType, originCountry, safetyRecord, recallHistory, emotionalTag));
        emit ProductCredibilityAudited(productType, originCountry, safetyRecord, recallHistory, emotionalTag);
    }
}
