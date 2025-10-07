// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetSanctumProtocol {
    address public originator;

    struct BudgetScroll {
        string projectTag;
        string auditSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BudgetScroll[] public budgetLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBudgetScroll(
        string memory projectTag,
        string memory auditSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        budgetLedger.push(BudgetScroll({
            projectTag: projectTag,
            auditSignal: auditSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
