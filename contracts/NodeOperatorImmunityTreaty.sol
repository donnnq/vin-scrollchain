// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NodeOperatorImmunityTreaty {
    address public originator;

    struct ImmunityScroll {
        string nodeTag;
        string legalSignal;
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
        string memory nodeTag,
        string memory legalSignal,
        string memory immunityAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            nodeTag: nodeTag,
            legalSignal: legalSignal,
            immunityAction: immunityAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
