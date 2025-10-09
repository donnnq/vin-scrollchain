// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TariffDividendDAO {
    address public originator;

    struct DividendScroll {
        address taxpayer;
        uint256 amount;
        bool isEligible;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    DividendScroll[] public dividendLedger;

    constructor() {
        originator = msg.sender;
    }

    function logDividendScroll(
        address taxpayer,
        uint256 amount,
        bool isEligible,
        bool isScrollchainSealed
    ) external {
        dividendLedger.push(DividendScroll({
            taxpayer: taxpayer,
            amount: amount,
            isEligible: isEligible,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
