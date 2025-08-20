// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinBlessingLedger {
    struct Blessing {
        address citizen;
        uint256 amount;
        uint256 timestamp;
    }

    Blessing[] public blessings;
    mapping(address => uint256) public totalBlessed;

    event BlessingLogged(address indexed citizen, uint256 amount, uint256 timestamp);

    function logBlessing(address citizen, uint256 amount) external {
        require(amount > 0, "Blessing must be greater than zero.");
        blessings.push(Blessing(citizen, amount, block.timestamp));
        totalBlessed[citizen] += amount;
        emit BlessingLogged(citizen, amount, block.timestamp);
    }

    function getBlessing(uint256 index) external view returns (address, uint256, uint256) {
        Blessing memory b = blessings[index];
        return (b.citizen, b.amount, b.timestamp);
    }

    function getTotalBlessed(address citizen) external view returns (uint256) {
        return totalBlessed[citizen];
    }

    function getBlessingCount() external view returns (uint256) {
        return blessings.length;
    }
}
