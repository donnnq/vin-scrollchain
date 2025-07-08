// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollOfBurningIntent {
    event Burned(address indexed from, uint256 amount);

    function burn() external payable {
        require(msg.value > 0, "No ETH sent.");
        emit Burned(msg.sender, msg.value);
        // ETH is burned by sending to address(0)
        payable(address(0)).transfer(msg.value);
    }
}
