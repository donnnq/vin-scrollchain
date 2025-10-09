// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ReceiptsStartupCommonsDAO {
    address public originator;

    struct ReceiptScroll {
        string startupTag;
        string receiptsSignal;
        string commonsAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ReceiptScroll[] public receiptsLedger;

    constructor() {
        originator = msg.sender;
    }

    function logReceiptScroll(
        string memory startupTag,
        string memory receiptsSignal,
        string memory commonsAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        receiptsLedger.push(ReceiptScroll({
            startupTag: startupTag,
            receiptsSignal: receiptsSignal,
            commonsAction: commonsAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
