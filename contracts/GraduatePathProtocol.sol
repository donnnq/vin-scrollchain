// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GraduatePathProtocol {
    address public originator;

    struct CareerScroll {
        string learnerTag;
        string careerSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CareerScroll[] public careerLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCareerScroll(
        string memory learnerTag,
        string memory careerSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        careerLedger.push(CareerScroll({
            learnerTag: learnerTag,
            careerSignal: careerSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
