// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlMasterPlanBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string region;
        string timestamp;
        string planTitle;
        string agencyInvolved;
        string emotionalTag;
    }

    BroadcastEntry[] public broadcasts;

    event MasterPlanBroadcasted(string region, string timestamp, string planTitle, string agencyInvolved, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastPlan(
        string memory region,
        string memory timestamp,
        string memory planTitle,
        string memory agencyInvolved,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(BroadcastEntry(region, timestamp, planTitle, agencyInvolved, emotionalTag));
        emit MasterPlanBroadcasted(region, timestamp, planTitle, agencyInvolved, emotionalTag);
    }
}
