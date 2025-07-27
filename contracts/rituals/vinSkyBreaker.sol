// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSkyBreaker {
    event ThunderCalled(string title);
    event CloudsArmed(uint256 impactLevel);

    function callTheThunder(string memory title) public {
        emit ThunderCalled(title);
    }

    function armTheClouds(uint256 impactLevel) public {
        require(impactLevel > 0, "Minimum impact required.");
        emit CloudsArmed(impactLevel);
    }
}
