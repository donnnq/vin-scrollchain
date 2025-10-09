// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AutomationExclusionTreaty {
    address public originator;

    mapping(string => bool) public roleRequiresHuman;

    event RoleProtected(string role, string stewardTag, uint256 timestamp);

    constructor() {
        originator = msg.sender;
    }

    function protectRole(string memory role, string memory stewardTag) external {
        roleRequiresHuman[role] = true;
        emit RoleProtected(role, stewardTag, block.timestamp);
    }

    function checkIfHumanRequired(string memory role) external view returns (bool) {
        return roleRequiresHuman[role];
    }
}
