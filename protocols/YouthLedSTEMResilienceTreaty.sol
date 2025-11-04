// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLedSTEMResilienceTreaty {
    address public steward;

    struct ResilienceClause {
        string barangay;
        string STEMFocus;
        string resilienceMechanism;
        string emotionalTag;
    }

    ResilienceClause[] public treatyLog;

    event STEMResilienceTagged(string barangay, string STEMFocus, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory STEMFocus,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ResilienceClause(barangay, STEMFocus, resilienceMechanism, emotionalTag));
        emit STEMResilienceTagged(barangay, STEMFocus, resilienceMechanism, emotionalTag);
    }
}
