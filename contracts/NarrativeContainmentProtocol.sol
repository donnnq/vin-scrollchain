// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NarrativeContainmentProtocol {
    address public originator;

    struct BroadcastScroll {
        string mediaTag;
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
        string memory mediaTag,
        string memory containmentSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            mediaTag: mediaTag,
            containmentSignal: containmentSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
