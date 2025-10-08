// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SentencingProtocol {
    address public originator;

    struct SentencingScroll {
        string defendantTag;
        string sentenceSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SentencingScroll[] public sentencingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSentencingScroll(
        string memory defendantTag,
        string memory sentenceSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        sentencingLedger.push(SentencingScroll({
            defendantTag: defendantTag,
            sentenceSignal: sentenceSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
