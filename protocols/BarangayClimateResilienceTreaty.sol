// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayClimateResilienceTreaty {
    address public steward;

    struct TreatyClause {
        string barangay;
        string resilienceSignal;
        string displacementShield;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event ClimateResilienceTagged(string barangay, string resilienceSignal, string displacementShield, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory resilienceSignal,
        string memory displacementShield,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(barangay, resilienceSignal, displacementShield, emotionalTag));
        emit ClimateResilienceTagged(barangay, resilienceSignal, displacementShield, emotionalTag);
    }
}
