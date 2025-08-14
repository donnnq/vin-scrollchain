// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title HappypillTrigger - Micro-restoration engine for joy rituals
/// @notice Deploys emotional APR via surprise blessings and civic humor

contract HappypillTrigger {
    address public steward;
    mapping(address => string[]) public joyLog;

    event JoyBlessed(address indexed user, string message);

    constructor() {
        steward = msg.sender;
    }

    function blessJoy(address _user, string memory _message) external {
        joyLog[_user].push(_message);
        emit JoyBlessed(_user, _message);
    }

    function getJoyLog(address _user) external view returns (string[] memory) {
        return joyLog[_user];
    }
}
