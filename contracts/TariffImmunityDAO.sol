// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TariffImmunityDAO {
    address public originator;

    struct ImmunityScroll {
        string companyTag;
        string investmentSignal;
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
        string memory companyTag,
        string memory investmentSignal,
        string memory immunityAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            companyTag: companyTag,
            investmentSignal: investmentSignal,
            immunityAction: immunityAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
