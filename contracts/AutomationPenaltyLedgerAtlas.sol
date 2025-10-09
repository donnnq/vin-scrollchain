// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AutomationPenaltyLedgerAtlas {
    address public originator;

    struct PenaltyScroll {
        string companyTag;
        uint256 automationScore;
        uint256 penaltyAmount;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PenaltyScroll[] public penaltyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPenaltyScroll(
        string memory companyTag,
        uint256 automationScore,
        uint256 penaltyAmount,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        penaltyLedger.push(PenaltyScroll({
            companyTag: companyTag,
            automationScore: automationScore,
            penaltyAmount: penaltyAmount,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
