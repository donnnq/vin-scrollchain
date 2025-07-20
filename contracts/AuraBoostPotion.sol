// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AuraBoostPotion {
    mapping(address => uint256) public boostLevel;
    uint256 public maxBoost = 888;

    event PotionConsumed(address indexed user, uint256 boostAmount, string incantation);

    function consumeBoost(address _user, uint256 _requestedBoost, string calldata _incantation) external {
        require(_requestedBoost <= maxBoost, "Too much kilig!");
        boostLevel[_user] += _requestedBoost;

        emit PotionConsumed(_user, _requestedBoost, _incantation);
    }

    function getBoostLevel(address _user) external view returns (uint256) {
        return boostLevel[_user];
    }
}
