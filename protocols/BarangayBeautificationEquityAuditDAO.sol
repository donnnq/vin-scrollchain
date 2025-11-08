// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBeautificationEquityAuditDAO {
    address public steward;

    struct AuditEntry {
        string timestamp;
        string barangayName;
        string beautificationLevel;
        string disparitySignal;
        string equityTag;
    }

    AuditEntry[] public registry;

    event BeautificationEquityAudited(string timestamp, string barangayName, string beautificationLevel, string disparitySignal, string equityTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditBeautification(
        string memory timestamp,
        string memory barangayName,
        string memory beautificationLevel,
        string memory disparitySignal,
        string memory equityTag
    ) public onlySteward {
        registry.push(AuditEntry(timestamp, barangayName, beautificationLevel, disparitySignal, equityTag));
        emit BeautificationEquityAudited(timestamp, barangayName, beautificationLevel, disparitySignal, equityTag);
    }
}
