// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FundingEquityProtocol {
    address public originator;

    struct FundingScroll {
        string contributorTag;
        string fundingSource;
        uint256 amount;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FundingScroll[] public fundingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFundingScroll(
        string memory contributorTag,
        string memory fundingSource,
        uint256 amount,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        fundingLedger.push(FundingScroll({
            contributorTag: contributorTag,
            fundingSource: fundingSource,
            amount: amount,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
