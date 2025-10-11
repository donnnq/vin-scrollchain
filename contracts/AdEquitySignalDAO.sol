// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AdEquitySignalDAO {
    address public originator;

    struct AdEquitySignal {
        string adCategory;
        bool isUserPreferred;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AdEquitySignal[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAdEquitySignal(
        string memory adCategory,
        bool isUserPreferred,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(AdEquitySignal({
            adCategory: adCategory,
            isUserPreferred: isUserPreferred,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
