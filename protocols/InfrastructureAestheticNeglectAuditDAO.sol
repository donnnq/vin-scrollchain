// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureAestheticNeglectAuditDAO {
    address public steward;

    struct AuditEntry {
        string timestamp;
        string location;
        string infrastructureType;
        string neglectType;
        string civicFatigueSignal;
        string beautificationGapTag;
    }

    AuditEntry[] public registry;

    event AestheticNeglectAudited(string timestamp, string location, string infrastructureType, string neglectType, string civicFatigueSignal, string beautificationGapTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditNeglect(
        string memory timestamp,
        string memory location,
        string memory infrastructureType,
        string memory neglectType,
        string memory civicFatigueSignal,
        string memory beautificationGapTag
    ) public onlySteward {
        registry.push(AuditEntry(timestamp, location, infrastructureType, neglectType, civicFatigueSignal, beautificationGapTag));
        emit AestheticNeglectAudited(timestamp, location, infrastructureType, neglectType, civicFatigueSignal, beautificationGapTag);
    }
}
