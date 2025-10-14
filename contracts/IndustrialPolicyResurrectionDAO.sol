// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IndustrialPolicyResurrectionDAO {
    address public admin;

    struct PolicyEntry {
        string sector;
        string strategy;
        string emotionalTag;
        bool activated;
    }

    PolicyEntry[] public policies;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPolicy(string memory _sector, string memory _strategy, string memory _emotionalTag) external onlyAdmin {
        policies.push(PolicyEntry(_sector, _strategy, _emotionalTag, false));
    }

    function activatePolicy(uint256 index) external onlyAdmin {
        policies[index].activated = true;
    }

    function getPolicy(uint256 index) external view returns (PolicyEntry memory) {
        return policies[index];
    }
}
