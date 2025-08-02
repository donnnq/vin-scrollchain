// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinOrientationSaga {
    mapping(address => bool) public hasCompleted;

    function completeOrientation(address applicant) public {
        hasCompleted[applicant] = true;
    }

    function checkStatus(address applicant) public view returns (bool) {
        return hasCompleted[applicant];
    }
}
