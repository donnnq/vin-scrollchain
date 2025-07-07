// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollHierarchy {
    function getRole(address agent) external view returns (uint8);
}

contract VinScrollOps {
    enum Role { None, Watcher, Reporter, Guardian, Troop, MenInBlack }

    IVinScrollHierarchy public hierarchy;
    address public immutable opsCommander;

    event MissionExecuted(address indexed agent, Role role, string operation, string target, uint256 timestamp);
    event UnauthorizedAttempt(address indexed agent, string attemptedAction, uint256 timestamp);

    modifier onlyRole(Role required) {
        Role r = Role(hierarchy.getRole(msg.sender));
        if (r != required) {
            emit UnauthorizedAttempt(msg.sender, _roleToString(required), block.timestamp);
            revert("Unauthorized role");
        }
        _;
    }

    constructor(address hierarchyAddress) {
        hierarchy = IVinScrollHierarchy(hierarchyAddress);
        opsCommander = msg.sender;
    }

    function executeIntelSweep(string calldata target) external onlyRole(Role.Watcher) {
        emit MissionExecuted(msg.sender, Role.Watcher, "Intel Sweep", target, block.timestamp);
    }

    function fileReport(string calldata target) external onlyRole(Role.Reporter) {
        emit MissionExecuted(msg.sender, Role.Reporter, "Filed Report", target, block.timestamp);
    }

    function deployShield(string calldata target) external onlyRole(Role.Guardian) {
        emit MissionExecuted(msg.sender, Role.Guardian, "Deployed Shield", target, block.timestamp);
    }

    function enforceRitual(string calldata target) external onlyRole(Role.Troop) {
        emit MissionExecuted(msg.sender, Role.Troop, "Enforced Ritual", target, block.timestamp);
    }

    function suppressEntropy(string calldata target) external onlyRole(Role.MenInBlack) {
        emit MissionExecuted(msg.sender, Role.MenInBlack, "Suppressed Entropy", target, block.timestamp);
    }

    function _roleToString(Role r) internal pure returns (string memory) {
        if (r == Role.Watcher) return "Watcher";
        if (r == Role.Reporter) return "Reporter";
        if (r == Role.Guardian) return "Guardian";
        if (r == Role.Troop) return "Troop";
        if (r == Role.MenInBlack) return "MenInBlack";
        return "None";
    }
}
