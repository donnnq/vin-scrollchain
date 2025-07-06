// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollHierarchy {
    enum Role { None, Watcher, Reporter, Guardian, Troop, MenInBlack }

    mapping(address => Role) public roles;
    address public immutable commander;

    event RoleAssigned(address indexed agent, Role role);
    event RoleRevoked(address indexed agent);
    event OperationLogged(address indexed agent, Role role, string action, uint256 timestamp);

    modifier onlyCommander() {
        require(msg.sender == commander, "Not the commander");
        _;
    }

    modifier onlyRole(Role r) {
        require(roles[msg.sender] == r, "Unauthorized role");
        _;
    }

    constructor() {
        commander = msg.sender;
    }

    function assignRole(address agent, Role role) external onlyCommander {
        roles[agent] = role;
        emit RoleAssigned(agent, role);
    }

    function revokeRole(address agent) external onlyCommander {
        roles[agent] = Role.None;
        emit RoleRevoked(agent);
    }

    function logOperation(string calldata action) external {
        Role r = roles[msg.sender];
        require(r != Role.None, "No role assigned");
        emit OperationLogged(msg.sender, r, action, block.timestamp);
    }

    function getRole(address agent) external view returns (Role) {
        return roles[agent];
    }
}
