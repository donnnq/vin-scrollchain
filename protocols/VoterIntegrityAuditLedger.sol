// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterIntegrityAuditLedger {
    address public steward;

    struct IntegrityEntry {
        string jurisdiction;
        string voterIDProtocol;
        string candidateCompliance;
        string emotionalTag;
    }

    IntegrityEntry[] public ledger;

    event VoterIntegrityTagged(string jurisdiction, string voterIDProtocol, string candidateCompliance, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagIntegrity(
        string memory jurisdiction,
        string memory voterIDProtocol,
        string memory candidateCompliance,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(IntegrityEntry(jurisdiction, voterIDProtocol, candidateCompliance, emotionalTag));
        emit VoterIntegrityTagged(jurisdiction, voterIDProtocol, candidateCompliance, emotionalTag);
    }
}
