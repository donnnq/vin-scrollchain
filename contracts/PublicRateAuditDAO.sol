// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicRateAuditDAO {
    address public originator;

    struct RateScroll {
        string assetTag;
        string auditSignal;
        string rateAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RateScroll[] public rateLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRateScroll(
        string memory assetTag,
        string memory auditSignal,
        string memory rateAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        rateLedger.push(RateScroll({
            assetTag: assetTag,
            auditSignal: auditSignal,
            rateAction: rateAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
