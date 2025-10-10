// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RegionalBankBroadcastCommonsDAO {
    address public originator;

    struct BroadcastScroll {
        string regionTag;
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
        string memory regionTag,
        string memory broadcastSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            regionTag: regionTag,
            broadcastSignal: broadcastSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
