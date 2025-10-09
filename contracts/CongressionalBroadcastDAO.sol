// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CongressionalBroadcastDAO {
    address public originator;

    struct BroadcastScroll {
        string corridorTag;
        string broadcastSignal;
        string legislativeAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BroadcastScroll[] public broadcastLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBroadcastScroll(
        string memory corridorTag,
        string memory broadcastSignal,
        string memory legislativeAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            corridorTag: corridorTag,
            broadcastSignal: broadcastSignal,
            legislativeAction: legislativeAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
