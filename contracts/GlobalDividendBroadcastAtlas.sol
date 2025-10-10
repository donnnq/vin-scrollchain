// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalDividendBroadcastAtlas {
    address public originator;

    struct BroadcastScroll {
        address worker;
        string countryTag;
        uint256 dividendAmount;
        string broadcastSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BroadcastScroll[] public broadcastLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBroadcastScroll(
        address worker,
        string memory countryTag,
        uint256 dividendAmount,
        string memory broadcastSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            worker: worker,
            countryTag: countryTag,
            dividendAmount: dividendAmount,
            broadcastSignal: broadcastSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
