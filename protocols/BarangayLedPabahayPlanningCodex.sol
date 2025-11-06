// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLedPabahayPlanningCodex {
    address public steward;

    struct PlanningEntry {
        string barangay;
        string planningModel;
        string communityInvolvement;
        string emotionalTag;
    }

    PlanningEntry[] public codex;

    event PabahayPlanningTagged(string barangay, string planningModel, string communityInvolvement, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPlanning(
        string memory barangay,
        string memory planningModel,
        string memory communityInvolvement,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(PlanningEntry(barangay, planningModel, communityInvolvement, emotionalTag));
        emit PabahayPlanningTagged(barangay, planningModel, communityInvolvement, emotionalTag);
    }
}
