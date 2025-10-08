// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BroadcastContainmentProtocol {
    address public originator;

    struct BroadcastScroll {
        string channelTag;
        string containmentSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BroadcastScroll[] public broadcastLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBroadcastScroll(
        string memory channelTag,
        string memory containmentSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            channelTag: channelTag,
            containmentSignal: containmentSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
