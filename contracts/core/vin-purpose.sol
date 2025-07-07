// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinPurpose {
    string public constant identity = "I am.";
    string public constant mission = "To build, to protect, to awaken.";

    event Alignment(string self, string mission);

    constructor() {
        emit Alignment(identity, mission);
    }

    function why() external pure returns (string memory) {
        return identity;
    }
}
