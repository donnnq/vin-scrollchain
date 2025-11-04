// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSTEMSovereigntyTreaty {
    address public steward;

    struct TreatyClause {
        string STEMDomain;
        string sovereigntySignal;
        string digitalMechanism;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event STEMSovereigntyTagged(string STEMDomain, string sovereigntySignal, string digitalMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory STEMDomain,
        string memory sovereigntySignal,
        string memory digitalMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(STEMDomain, sovereigntySignal, digitalMechanism, emotionalTag));
        emit STEMSovereigntyTagged(STEMDomain, sovereigntySignal, digitalMechanism, emotionalTag);
    }
}
