// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollRotation {
    address[] public featured;
    uint256 public rotationInterval = 1 days;

    function addScroll(address scroll) external {
        featured.push(scroll);
    }

    function getCurrentScroll() public view returns (address) {
        uint256 index = (block.timestamp / rotationInterval) % featured.length;
        return featured[index];
    }
}
