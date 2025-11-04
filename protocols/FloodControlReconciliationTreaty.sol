// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlReconciliationTreaty {
    address public steward;

    struct ReconciliationClause {
        string projectLocation;
        string failureType;
        string reconciliationMechanism;
        string emotionalTag;
    }

    ReconciliationClause[] public treatyLog;

    event FloodControlReconciled(string projectLocation, string failureType, string reconciliationMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function reconcileFloodControl(
        string memory projectLocation,
        string memory failureType,
        string memory reconciliationMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ReconciliationClause(projectLocation, failureType, reconciliationMechanism, emotionalTag));
        emit FloodControlReconciled(projectLocation, failureType, reconciliationMechanism, emotionalTag);
    }
}
