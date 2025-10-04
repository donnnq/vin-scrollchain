// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetJusticeProtocol {
    address public originator;

    struct BudgetScroll {
        string regionTag;
        string fundSource;
        uint256 allocatedAmount;
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
        string memory regionTag,
        string memory fundSource,
        uint256 allocatedAmount,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        budgetLedger.push(BudgetScroll({
            regionTag: regionTag,
            fundSource: fundSource,
            allocatedAmount: allocatedAmount,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
