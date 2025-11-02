// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterSuppressionAuditCodex {
    address public steward;

    struct SuppressionEntry {
        string suppressionMethod;
        string affectedDemographic;
        string auditProtocol;
        string emotionalTag;
    }

    SuppressionEntry[] public codex;

    event VoterSuppressionLogged(string suppressionMethod, string affectedDemographic, string auditProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSuppression(
        string memory suppressionMethod,
        string memory affectedDemographic,
        string memory auditProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SuppressionEntry(suppressionMethod, affectedDemographic, auditProtocol, emotionalTag));
        emit VoterSuppressionLogged(suppressionMethod, affectedDemographic, auditProtocol, emotionalTag);
    }
}
