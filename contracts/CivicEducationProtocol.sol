// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CivicEducationProtocol {
    address public originator;

    struct EducationScroll {
        string schoolTag;
        string moduleType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EducationScroll[] public educationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEducationScroll(
        string memory schoolTag,
        string memory moduleType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        educationLedger.push(EducationScroll({
            schoolTag: schoolTag,
            moduleType: moduleType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
