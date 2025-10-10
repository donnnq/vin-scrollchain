// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalWorkerSignalAtlas {
    address public originator;

    struct SignalScroll {
        address worker;
        string countryTag;
        string signalTag;
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
        string memory countryTag,
        string memory signalTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(SignalScroll({
            worker: worker,
            countryTag: countryTag,
            signalTag: signalTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
