// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GreyListImmunityTreaty {
    address public originator;

    struct ImmunityScroll {
        string countryTag;
        string financialSignal;
        string delistingDate;
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
        string memory financialSignal,
        string memory delistingDate,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            countryTag: countryTag,
            financialSignal: financialSignal,
            delistingDate: delistingDate,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
