// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLaborContinuityDAO {
    address public steward;

    struct ContinuityEntry {
        string workerName;
        string exitType;
        string continuityPlan;
        string emotionalTag;
    }

    ContinuityEntry[] public registry;

    event LaborContinuityTagged(string workerName, string exitType, string continuityPlan, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLaborContinuity(
        string memory workerName,
        string memory exitType,
        string memory continuityPlan,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ContinuityEntry(workerName, exitType, continuityPlan, emotionalTag));
        emit LaborContinuityTagged(workerName, exitType, continuityPlan, emotionalTag);
    }
}
