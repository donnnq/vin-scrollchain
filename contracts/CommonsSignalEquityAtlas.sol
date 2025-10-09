// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommonsSignalEquityAtlas {
    address public originator;

    struct SignalScroll {
        address worker;
        string signalTag;
        uint256 equityShare;
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
        uint256 equityShare,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(SignalScroll({
            worker: worker,
            signalTag: signalTag,
            equityShare: equityShare,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
