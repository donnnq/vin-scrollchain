// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalDebtImmunityIndex {
    address public originator;

    struct ImmunityScroll {
        string countryTag;
        string debtSignal;
        string immunityAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ImmunityScroll[] public immunityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logImmunityScroll(
        string memory countryTag,
        string memory debtSignal,
        string memory immunityAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            countryTag: countryTag,
            debtSignal: debtSignal,
            immunityAction: immunityAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
