// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BroadcastEquityCommonsDAO {
    address public originator;

    struct BroadcastScroll {
        address worker;
        string broadcastSignal;
        uint256 equityShare;
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
        uint256 equityShare,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            worker: worker,
            broadcastSignal: broadcastSignal,
            equityShare: equityShare,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
