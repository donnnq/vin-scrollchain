// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EmotionalAPR - Tracks emotional yield from kindness and joy rituals
/// @notice Calculates emotional return on interaction

contract EmotionalAPR {
    mapping(address => uint256) public joyDeposits;
    mapping(address => uint256) public emotionalYield;

    event JoyDeposited(address indexed user, uint256 amount);
    event YieldUpdated(address indexed user, uint256 newYield);

    function depositJoy(address _user, uint256 _amount) external {
        joyDeposits[_user] += _amount;
        emotionalYield[_user] = joyDeposits[_user] * 3; // Mythic multiplier
        emit JoyDeposited(_user, _amount);
        emit YieldUpdated(_user, emotionalYield[_user]);
    }

    function getYield(address _user) external view returns (uint256) {
        return emotionalYield[_user];
    }
}
