// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SoftwareSupportMappingDAO {
    address public originator;

    struct SupportScroll {
        string productTag;
        string supportStatus;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SupportScroll[] public supportLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSupportScroll(
        string memory productTag,
        string memory supportStatus,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        supportLedger.push(SupportScroll({
            productTag: productTag,
            supportStatus: supportStatus,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
