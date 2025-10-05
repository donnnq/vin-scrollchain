// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MedicineAccessProtocol {
    address public originator;

    struct AccessScroll {
        string countryTag;
        string pricingBarrier;
        string patientImpactSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AccessScroll[] public accessLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAccessScroll(
        string memory countryTag,
        string memory pricingBarrier,
        string memory patientImpactSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        accessLedger.push(AccessScroll({
            countryTag: countryTag,
            pricingBarrier: pricingBarrier,
            patientImpactSignal: patientImpactSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
