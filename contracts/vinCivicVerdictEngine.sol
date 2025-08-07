// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinCivicVerdictEngine {
    uint256 public verdictStatus;

    constructor() {
        verdictStatus = 0;
    }

    function setVerdictStatus(uint256 _status) public {
        verdictStatus = _status;
    }

    function getVerdictStatus() public view returns (uint256) {
        return verdictStatus;
    }
}
