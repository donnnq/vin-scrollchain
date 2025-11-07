// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UNSecurityCouncilVetoAuditProtocol {
    address public steward;

    struct VetoEntry {
        string vetoingCountry;
        string blockedResolution;
        string humanitarianImpact;
        string emotionalTag;
    }

    VetoEntry[] public protocol;

    event VetoAbuseTagged(string vetoingCountry, string blockedResolution, string humanitarianImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagVetoAbuse(
        string memory vetoingCountry,
        string memory blockedResolution,
        string memory humanitarianImpact,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(VetoEntry(vetoingCountry, blockedResolution, humanitarianImpact, emotionalTag));
        emit VetoAbuseTagged(vetoingCountry, blockedResolution, humanitarianImpact, emotionalTag);
    }
}
