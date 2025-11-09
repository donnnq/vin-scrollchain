// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MarketCapFibonacciBreakdownMonitor {
    address public validator;
    uint256 public fibSupport = 3490000000000; // $3.49T
    uint256 public fibFloor = 2420000000000;   // $2.42T

    event BreakdownDetected(uint256 marketCap, uint256 timestamp);
    event RecoveryDetected(uint256 marketCap, uint256 timestamp);

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function reportMarketCap(uint256 _marketCap) public onlyValidator {
        if (_marketCap < fibSupport) {
            emit BreakdownDetected(_marketCap, block.timestamp);
        } else {
            emit RecoveryDetected(_marketCap, block.timestamp);
        }
    }
}
