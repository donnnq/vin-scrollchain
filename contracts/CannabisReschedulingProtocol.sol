// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisReschedulingProtocol {
    address public originator;

    struct ReschedulingScroll {
        string substanceTag;
        string policySignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ReschedulingScroll[] public reschedulingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logReschedulingScroll(
        string memory substanceTag,
        string memory policySignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        reschedulingLedger.push(ReschedulingScroll({
            substanceTag: substanceTag,
            policySignal: policySignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
