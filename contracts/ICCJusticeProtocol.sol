// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ICCJusticeProtocol {
    address public originator;

    struct JusticeScroll {
        string respondentTag;
        string consequenceSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    JusticeScroll[] public justiceLedger;

    constructor() {
        originator = msg.sender;
    }

    function logJusticeScroll(
        string memory respondentTag,
        string memory consequenceSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        justiceLedger.push(JusticeScroll({
            respondentTag: respondentTag,
            consequenceSignal: consequenceSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
