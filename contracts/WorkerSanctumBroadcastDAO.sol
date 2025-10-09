// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WorkerSanctumBroadcastDAO {
    address public originator;

    struct BroadcastScroll {
        address worker;
        string broadcastSignal;
        string sanctumTag;
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
        string memory broadcastSignal,
        string memory sanctumTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            worker: worker,
            broadcastSignal: broadcastSignal,
            sanctumTag: sanctumTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
