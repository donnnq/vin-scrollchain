// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateInfrastructureMasterPlanManifest {
    address public steward;

    struct MasterPlanEntry {
        string region;
        string timestamp;
        string protocolChained;
        string ecologicalImpact;
        string youthStewardshipStatus;
        string emotionalTag;
    }

    MasterPlanEntry[] public manifest;

    event MasterPlanChained(string region, string timestamp, string protocolChained, string ecologicalImpact, string youthStewardshipStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function chainMasterPlan(
        string memory region,
        string memory timestamp,
        string memory protocolChained,
        string memory ecologicalImpact,
        string memory youthStewardshipStatus,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(MasterPlanEntry(region, timestamp, protocolChained, ecologicalImpact, youthStewardshipStatus, emotionalTag));
        emit MasterPlanChained(region, timestamp, protocolChained, ecologicalImpact, youthStewardshipStatus, emotionalTag);
    }
}
