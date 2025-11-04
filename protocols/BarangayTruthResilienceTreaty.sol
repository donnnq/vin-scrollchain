// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTruthResilienceTreaty {
    address public steward;

    struct TreatyClause {
        string barangay;
        string truthSignal;
        string resilienceMechanism;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event TruthResilienceTagged(string barangay, string truthSignal, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory truthSignal,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(barangay, truthSignal, resilienceMechanism, emotionalTag));
        emit TruthResilienceTagged(barangay, truthSignal, resilienceMechanism, emotionalTag);
    }
}
