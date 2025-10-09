// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DividendSunsetProtocol {
    address public originator;

    struct SunsetScroll {
        address taxpayer;
        string sunsetSignal;
        uint256 finalPayoutAmount;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SunsetScroll[] public sunsetLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSunsetScroll(
        address taxpayer,
        string memory sunsetSignal,
        uint256 finalPayoutAmount,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        sunsetLedger.push(SunsetScroll({
            taxpayer: taxpayer,
            sunsetSignal: sunsetSignal,
            finalPayoutAmount: finalPayoutAmount,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
