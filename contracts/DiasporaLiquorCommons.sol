// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiasporaLiquorCommons {
    address public originator;

    struct LiquorScroll {
        string liquorTag;
        string diasporaSignal;
        string commonsAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LiquorScroll[] public liquorLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLiquorScroll(
        string memory liquorTag,
        string memory diasporaSignal,
        string memory commonsAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        liquorLedger.push(LiquorScroll({
            liquorTag: liquorTag,
            diasporaSignal: diasporaSignal,
            commonsAction: commonsAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
