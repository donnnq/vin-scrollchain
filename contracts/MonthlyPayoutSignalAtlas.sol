// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MonthlyPayoutSignalAtlas {
    address public originator;

    struct SignalScroll {
        address taxpayer;
        string payoutSignal;
        uint256 amount;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SignalScroll[] public signalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSignalScroll(
        address taxpayer,
        string memory payoutSignal,
        uint256 amount,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(SignalScroll({
            taxpayer: taxpayer,
            payoutSignal: payoutSignal,
            amount: amount,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
