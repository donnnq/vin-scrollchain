// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SpiritsBroadcastProtocol {
    address public originator;

    struct BroadcastScroll {
        string spiritTag;
        string broadcastSignal;
        string protocolAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BroadcastScroll[] public broadcastLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBroadcastScroll(
        string memory spiritTag,
        string memory broadcastSignal,
        string memory protocolAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            spiritTag: spiritTag,
            broadcastSignal: broadcastSignal,
            protocolAction: protocolAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
