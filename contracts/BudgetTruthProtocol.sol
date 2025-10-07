// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetTruthProtocol {
    address public originator;

    struct BudgetScroll {
        string agencyTag;
        string fundSignal;
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
        string memory agencyTag,
        string memory fundSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        budgetLedger.push(BudgetScroll({
            agencyTag: agencyTag,
            fundSignal: fundSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
