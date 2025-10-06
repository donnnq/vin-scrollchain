// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VendorGrantProtocol {
    address public originator;

    struct GrantScroll {
        string vendorTag;
        string corridorTag;
        string grantPurpose;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    GrantScroll[] public vendorLedger;

    constructor() {
        originator = msg.sender;
    }

    function logGrantScroll(
        string memory vendorTag,
        string memory corridorTag,
        string memory grantPurpose,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        vendorLedger.push(GrantScroll({
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
