// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinJoySanctuary {
    address public deployArchitect;
    uint256 public totalStoredJoy;

    event JoyDeposited(string fromCity, uint256 amount, uint256 newTotal);
    event JoyWithdrawn(string toCity, uint256 amount, uint256 remainingTotal);

    modifier onlyArchitect() {
        require(msg.sender == deployArchitect, "Unauthorized");
        _;
    }

    constructor(address _architect) {
        deployArchitect = _architect;
    }

    function depositJoy(string memory fromCity, uint256 amount) external onlyArchitect {
        totalStoredJoy += amount;
        emit JoyDeposited(fromCity, amount, totalStoredJoy);
    }

    function withdrawJoy(string memory toCity, uint256 amount) external onlyArchitect {
        require(totalStoredJoy >= amount, "Not enough stored joy");
        totalStoredJoy -= amount;
        emit JoyWithdrawn(toCity, amount, totalStoredJoy);
    }

    function getStoredJoy() external view returns (uint256) {
        return totalStoredJoy;
    }
}
