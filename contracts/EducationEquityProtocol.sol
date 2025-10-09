// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EducationEquityProtocol {
    address public originator;

    struct EnrollmentScroll {
        string schoolTag;
        string supplySignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EnrollmentScroll[] public enrollmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEnrollmentScroll(
        string memory schoolTag,
        string memory supplySignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        enrollmentLedger.push(EnrollmentScroll({
            schoolTag: schoolTag,
            supplySignal: supplySignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
