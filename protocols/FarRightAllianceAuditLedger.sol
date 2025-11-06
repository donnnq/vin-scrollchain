// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarRightAllianceAuditLedger {
    address public steward;

    struct AllianceEntry {
        string supportingNation;
        string farRightRegime;
        string auditProtocol;
        string emotionalTag;
    }

    AllianceEntry[] public ledger;

    event FarRightAllianceAudited(string supportingNation, string farRightRegime, string auditProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditAlliance(
        string memory supportingNation,
        string memory farRightRegime,
        string memory auditProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(AllianceEntry(supportingNation, farRightRegime, auditProtocol, emotionalTag));
        emit FarRightAllianceAudited(supportingNation, farRightRegime, auditProtocol, emotionalTag);
    }
}
