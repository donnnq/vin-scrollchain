// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JusticePayoutBroadcastDAO {
    address public originator;

    struct PayoutScroll {
        string workerTag;
        string platformTag;
        uint256 amount;
        string payoutSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PayoutScroll[] public payoutLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPayoutScroll(
        string memory workerTag,
        string memory platformTag,
        uint256 amount,
        string memory payoutSignal,
        bool isScrollchainSealed
    ) external {
        payoutLedger.push(PayoutScroll({
            workerTag: workerTag,
            platformTag: platformTag,
            amount: amount,
            payoutSignal: payoutSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
