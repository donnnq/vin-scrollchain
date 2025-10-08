// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DOJIndictmentRegistry {
    address public originator;

    struct IndictmentScroll {
        string defendantTag;
        string violationSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    IndictmentScroll[] public indictmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logIndictmentScroll(
        string memory defendantTag,
        string memory violationSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        indictmentLedger.push(IndictmentScroll({
            defendantTag: defendantTag,
            violationSignal: violationSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
