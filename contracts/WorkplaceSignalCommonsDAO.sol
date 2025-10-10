// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WorkplaceSignalCommonsDAO {
    address public originator;

    struct SignalScroll {
        address worker;
        string signalTag; // "WFH", "WFO", "Hybrid", etc.
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SignalScroll[] public signalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSignalScroll(
        address worker,
        string memory signalTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(SignalScroll({
            worker: worker,
            signalTag: signalTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
