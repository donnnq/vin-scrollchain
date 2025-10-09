// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DividendExclusionAppealsTreaty {
    address public originator;

    struct AppealScroll {
        address appellant;
        string exclusionReason;
        string appealSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AppealScroll[] public appealLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAppealScroll(
        address appellant,
        string memory exclusionReason,
        string memory appealSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        appealLedger.push(AppealScroll({
            appellant: appellant,
            exclusionReason: exclusionReason,
            appealSignal: appealSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
