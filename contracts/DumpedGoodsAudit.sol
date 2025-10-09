// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DumpedGoodsAudit {
    address public originator;

    struct DumpingScroll {
        string productTag;
        string dumpingSignal;
        string auditAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    DumpingScroll[] public dumpingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logDumpingScroll(
        string memory productTag,
        string memory dumpingSignal,
        string memory auditAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        dumpingLedger.push(DumpingScroll({
            productTag: productTag,
            dumpingSignal: dumpingSignal,
            auditAction: auditAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
