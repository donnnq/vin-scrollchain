// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CustomsOverflowDAO {
    address public originator;

    struct OverflowScroll {
        string portTag;
        string overflowSignal;
        string mitigationAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OverflowScroll[] public overflowLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOverflowScroll(
        string memory portTag,
        string memory overflowSignal,
        string memory mitigationAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        overflowLedger.push(OverflowScroll({
            portTag: portTag,
            overflowSignal: overflowSignal,
            mitigationAction: mitigationAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
