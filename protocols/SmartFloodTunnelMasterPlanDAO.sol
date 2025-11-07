// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartFloodTunnelMasterPlanDAO {
    address public steward;

    struct TunnelPlan {
        string region;
        string timestamp;
        string blueprintTitle;
        uint256 budgetPHP;
        string ecologicalImpact;
        string emotionalTag;
    }

    TunnelPlan[] public plans;

    event TunnelMasterPlanChained(string region, string timestamp, string blueprintTitle, uint256 budgetPHP, string ecologicalImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function chainTunnelPlan(
        string memory region,
        string memory timestamp,
        string memory blueprintTitle,
        uint256 budgetPHP,
        string memory ecologicalImpact,
        string memory emotionalTag
    ) public onlySteward {
        plans.push(TunnelPlan(region, timestamp, blueprintTitle, budgetPHP, ecologicalImpact, emotionalTag));
        emit TunnelMasterPlanChained(region, timestamp, blueprintTitle, budgetPHP, ecologicalImpact, emotionalTag);
    }
}
