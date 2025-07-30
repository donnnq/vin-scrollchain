// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinPlanAppealRegistry.sol — Enables ritual-based appeals and reconsideration for public-facing scrollchain plans

contract vinPlanAppealRegistry {
    address public planner;
    uint public lastPlanId;

    struct Appeal {
        address appellant;
        string reason;
        uint timestamp;
    }

    struct Plan {
        string title;
        bool isActive;
        bool isReconsidered;
        Appeal[] appeals;
    }

    mapping(uint => Plan) public plans;

    event PlanDeployed(uint indexed planId, string title);
    event AppealFiled(address indexed appellant, uint indexed planId, string reason);
    event PlanReconsidered(uint indexed planId, bool modified);

    modifier onlyPlanner() {
        require(msg.sender == planner, "Unauthorized scrollholder");
        _;
    }

    constructor() {
        planner = msg.sender;
    }

    /// @notice Deploy a new governance plan
    function deployPlan(string memory title) public onlyPlanner {
        lastPlanId++;
        Plan storage newPlan = plans[lastPlanId];
        newPlan.title = title;
        newPlan.isActive = true;
        emit PlanDeployed(lastPlanId, title);
    }

    /// @notice File an appeal against a deployed plan
    function fileAppeal(uint planId, string memory reason) public {
        require(plans[planId].isActive, "Plan not found or inactive");
        plans[planId].appeals.push(Appeal({
            appellant: msg.sender,
            reason: reason,
            timestamp: block.timestamp
        }));
        emit AppealFiled(msg.sender, planId, reason);
    }

    /// @notice Reconsider a plan based on appeals
    function reconsiderPlan(uint planId, bool modifyPlan) public onlyPlanner {
        require(plans[planId].isActive, "Plan not active");
        plans[planId].isReconsidered = modifyPlan;
        emit PlanReconsidered(planId, modifyPlan);
    }

    /// @notice Get number of appeals filed for a plan
    function getAppealCount(uint planId) public view returns (uint) {
        return plans[planId].appeals.length;
    }

    /// @notice Retrieve specific appeal details
    function getAppeal(uint planId, uint index) public view returns (address, string memory, uint) {
        Appeal storage a = plans[planId].appeals[index];
        return (a.appellant, a.reason, a.timestamp);
    }
}
