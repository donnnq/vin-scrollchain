// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityHousingResilienceDAO {
    address public admin;

    struct ResiliencePlan {
        string barangay;
        string strategy;
        bool implemented;
    }

    ResiliencePlan[] public plans;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPlan(string memory _barangay, string memory _strategy) external onlyAdmin {
        plans.push(ResiliencePlan(_barangay, _strategy, false));
    }

    function markImplemented(uint256 index) external onlyAdmin {
        plans[index].implemented = true;
    }

    function getPlan(uint256 index) external view returns (ResiliencePlan memory) {
        return plans[index];
    }
}
