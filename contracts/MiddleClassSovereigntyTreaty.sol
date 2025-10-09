// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MiddleClassSovereigntyTreaty {
    address public originator;

    struct SovereigntyScroll {
        address taxpayer;
        string incomeBracket;
        string dividendSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SovereigntyScroll[] public sovereigntyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSovereigntyScroll(
        address taxpayer,
        string memory incomeBracket,
        string memory dividendSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        sovereigntyLedger.push(SovereigntyScroll({
            taxpayer: taxpayer,
            incomeBracket: incomeBracket,
            dividendSignal: dividendSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
