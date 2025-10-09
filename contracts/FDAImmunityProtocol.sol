// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FDAImmunityProtocol {
    address public originator;

    struct ImmunityScroll {
        string productTag;
        string approvalSignal;
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
        string memory productTag,
        string memory approvalSignal,
        string memory immunityAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            productTag: productTag,
            approvalSignal: approvalSignal,
            immunityAction: immunityAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
