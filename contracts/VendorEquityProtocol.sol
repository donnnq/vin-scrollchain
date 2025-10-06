// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VendorEquityProtocol {
    address public originator;

    struct EquityScroll {
        string vendorTag;
        string corridorTag;
        string grantPurpose;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EquityScroll[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEquityScroll(
        string memory vendorTag,
        string memory corridorTag,
        string memory grantPurpose,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(EquityScroll({
            vendorTag: vendorTag,
            corridorTag: corridorTag,
            grantPurpose: grantPurpose,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
