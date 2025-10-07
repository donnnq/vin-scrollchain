// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SenatePrivilegeSpeechTracker {
    address public originator;

    struct SpeechScroll {
        string senatorName;
        string speechTitle;
        string emotionalAPRTag;
        string governanceSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SpeechScroll[] public speechLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSpeechScroll(
        string memory senatorName,
        string memory speechTitle,
        string memory emotionalAPRTag,
        string memory governanceSignal,
        bool isScrollchainSealed
    ) external {
        speechLedger.push(SpeechScroll({
            senatorName: senatorName,
            speechTitle: speechTitle,
            emotionalAPRTag: emotionalAPRTag,
            governanceSignal: governanceSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
