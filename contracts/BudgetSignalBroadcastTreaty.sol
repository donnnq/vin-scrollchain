// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetSignalBroadcastTreaty {
    address public originator;

    struct SignalScroll {
        string agencyTag;
        string broadcastSignal;
        string budgetAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SignalScroll[] public signalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSignalScroll(
        string memory agencyTag,
        string memory broadcastSignal,
        string memory budgetAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(SignalScroll({
            agencyTag: agencyTag,
            broadcastSignal: broadcastSignal,
            budgetAction: budgetAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
