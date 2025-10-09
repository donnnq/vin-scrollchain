// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TariffDividendAppealsDAO {
    address public originator;

    struct AppealScroll {
        address appellant;
        string exclusionReason;
        string appealOutcome;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AppealScroll[] public appealsLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAppealScroll(
        address appellant,
        string memory exclusionReason,
        string memory appealOutcome,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        appealsLedger.push(AppealScroll({
            appellant: appellant,
            exclusionReason: exclusionReason,
            appealOutcome: appealOutcome,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
