// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DispensaryEquityProtocol {
    address public originator;

    struct RetailScroll {
        string productTag;
        string retailLocation;
        string containmentStatus;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RetailScroll[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRetailScroll(
        string memory productTag,
        string memory retailLocation,
        string memory containmentStatus,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(RetailScroll({
            productTag: productTag,
            retailLocation: retailLocation,
            containmentStatus: containmentStatus,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
