// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetChainAuditDAO {
    address public originator;

    struct BudgetScroll {
        string agencyTag;
        string auditSignal;
        string spendingAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BudgetScroll[] public budgetLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBudgetScroll(
        string memory agencyTag,
        string memory auditSignal,
        string memory spendingAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        budgetLedger.push(BudgetScroll({
            agencyTag: agencyTag,
            auditSignal: auditSignal,
            spendingAction: spendingAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
