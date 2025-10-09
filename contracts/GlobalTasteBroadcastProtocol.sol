// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalTasteBroadcastProtocol {
    address public originator;

    struct BroadcastScroll {
        string flavorTag;
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
        string memory flavorTag,
        string memory broadcastSignal,
        string memory protocolAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            flavorTag: flavorTag,
            broadcastSignal: broadcastSignal,
            protocolAction: protocolAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
