// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WhistleblowerSanctumProtocol {
    address public originator;

    struct TestimonyScroll {
        string regionTag;
        string issueType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TestimonyScroll[] public testimonyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTestimonyScroll(
        string memory regionTag,
        string memory issueType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        testimonyLedger.push(TestimonyScroll({
            regionTag: regionTag,
            issueType: issueType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
