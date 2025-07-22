// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollguardian
/// @notice Assigns immunity roles to agents of peace. Immune agents can’t be flagged or punished.
contract vinScrollguardian {
    address public immutable scrollkeeper;
    mapping(address => bool) public isImmune;

    event ImmunityGranted(address indexed agent);
    event ImmunityRevoked(address indexed agent);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function grantImmunity(address agent) external onlyScrollkeeper {
        isImmune[agent] = true;
        emit ImmunityGranted(agent);
    }

    function revokeImmunity(address agent) external onlyScrollkeeper {
        isImmune[agent] = false;
        emit ImmunityRevoked(agent);
    }

    function checkImmunity(address agent) external view returns (bool) {
        return isImmune[agent];
    }
}
