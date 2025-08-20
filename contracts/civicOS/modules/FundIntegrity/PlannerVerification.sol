// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract PlannerVerification {
    address public steward;

    struct Planner {
        string name;
        string licenseId;
        string civicRole;
        bool verified;
    }

    mapping(address => Planner) public planners;

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can verify");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerPlanner(
        address _plannerAddress,
        string memory _name,
        string memory _licenseId,
        string memory _civicRole
    ) public onlySteward {
        planners[_plannerAddress] = Planner(_name, _licenseId, _civicRole, false);
    }

    function verifyPlanner(address _plannerAddress) public onlySteward {
        require(bytes(planners[_plannerAddress].licenseId).length > 0, "Planner not registered");
        planners[_plannerAddress].verified = true;
    }

    function isVerified(address _plannerAddress) public view returns (bool) {
        return planners[_plannerAddress].verified;
    }
}
