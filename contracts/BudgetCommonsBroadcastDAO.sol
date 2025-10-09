// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetCommonsBroadcastDAO {
    address public originator;

    struct BroadcastScroll {
        string agencyTag;
        string broadcastSignal;
        string commonsAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BroadcastScroll[] public broadcastLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBroadcastScroll(
        string memory agencyTag,
        string memory broadcastSignal,
        string memory commonsAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            agencyTag: agencyTag,
            broadcastSignal: broadcastSignal,
            commonsAction: commonsAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
