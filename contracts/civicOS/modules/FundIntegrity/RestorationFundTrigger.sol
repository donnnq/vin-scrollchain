// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract RestorationFundTrigger {
    address public steward;
    uint256 public totalRedirected;

    struct SanctumPlan {
        address mayor;
        string siteLocation;
        string civicPurpose;
        string plannerName;
        string documentationLink;
        uint256 requestedAmount;
        bool approved;
        bool executed;
    }

    mapping(uint256 => SanctumPlan) public plans;
    uint256 public planCount;

    event PlanSubmitted(uint256 planId, string siteLocation, uint256 amount);
    event PlanApproved(uint256 planId, string siteLocation);
    event FundsRedirected(uint256 planId, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can approve plans");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function submitPlan(
        string memory _siteLocation,
        string memory _civicPurpose,
        string memory _plannerName,
        string memory _documentationLink,
        uint256 _requestedAmount
    ) public {
        plans[planCount] = SanctumPlan(
            msg.sender,
            _siteLocation,
            _civicPurpose,
            _plannerName,
            _documentationLink,
            _requestedAmount,
            false,
            false
        );
        emit PlanSubmitted(planCount, _siteLocation, _requestedAmount);
        planCount++;
    }

    function approvePlan(uint256 _planId) public onlySteward {
        require(!plans[_planId].approved, "Already approved");
        plans[_planId].approved = true;
        emit PlanApproved(_planId, plans[_planId].siteLocation);
    }

    function redirectFunds(uint256 _planId) public onlySteward {
        SanctumPlan storage plan = plans[_planId];
        require(plan.approved, "Plan not approved");
        require(!plan.executed, "Already executed");

        // Simulate fund transfer (actual transfer logic depends on treasury integration)
        totalRedirected += plan.requestedAmount;
        plan.executed = true;

        emit FundsRedirected(_planId, plan.requestedAmount);
    }

    function getPlan(uint256 _planId) public view returns (SanctumPlan memory) {
        return plans[_planId];
    }
}
