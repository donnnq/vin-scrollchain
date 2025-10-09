// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MentalHealthSanctumProtocol {
    address public originator;

    struct WellnessScroll {
        string schoolTag;
        string healingSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    WellnessScroll[] public wellnessLedger;

    constructor() {
        originator = msg.sender;
    }

    function logWellnessScroll(
        string memory schoolTag,
        string memory healingSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        wellnessLedger.push(WellnessScroll({
            schoolTag: schoolTag,
            healingSignal: healingSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
