// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ClinicalTrialProtocol {
    address public originator;

    struct TrialScroll {
        string compoundTag;
        string trialPhase;
        string accessBarrier;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TrialScroll[] public trialLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTrialScroll(
        string memory compoundTag,
        string memory trialPhase,
        string memory accessBarrier,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        trialLedger.push(TrialScroll({
            compoundTag: compoundTag,
            trialPhase: trialPhase,
            accessBarrier: accessBarrier,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
