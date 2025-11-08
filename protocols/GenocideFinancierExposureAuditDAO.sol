// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GenocideFinancierExposureAuditDAO {
    address public steward;

    struct ExposureEntry {
        string timestamp;
        string financierEntity;
        string fundingChannel;
        string verificationStatus;
        string evidenceGapSignal;
        string propagandaRiskTag;
    }

    ExposureEntry[] public registry;

    event GenocideFinancierAudited(string timestamp, string financierEntity, string fundingChannel, string verificationStatus, string evidenceGapSignal, string propagandaRiskTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditFinancier(
        string memory timestamp,
        string memory financierEntity,
        string memory fundingChannel,
        string memory verificationStatus,
        string memory evidenceGapSignal,
        string memory propagandaRiskTag
    ) public onlySteward {
        registry.push(ExposureEntry(timestamp, financierEntity, fundingChannel, verificationStatus, evidenceGapSignal, propagandaRiskTag));
        emit GenocideFinancierAudited(timestamp, financierEntity, fundingChannel, verificationStatus, evidenceGapSignal, propagandaRiskTag);
    }
}
