// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RentCapAuditRegistryDAO {
    address public admin;

    struct RentPolicy {
        string city;
        uint256 capPercent;
        bool active;
    }

    RentPolicy[] public policies;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPolicy(string memory _city, uint256 _capPercent) external onlyAdmin {
        policies.push(RentPolicy(_city, _capPercent, true));
    }

    function deactivatePolicy(uint256 index) external onlyAdmin {
        policies[index].active = false;
    }

    function getPolicy(uint256 index) external view returns (RentPolicy memory) {
        return policies[index];
    }
}
