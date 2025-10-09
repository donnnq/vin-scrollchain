// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VendorLockInAuditDAO {
    address public originator;

    struct VendorScroll {
        string vendorTag;
        string lockInSignal;
        string exitAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    VendorScroll[] public vendorLedger;

    constructor() {
        originator = msg.sender;
    }

    function logVendorScroll(
        string memory vendorTag,
        string memory lockInSignal,
        string memory exitAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        vendorLedger.push(VendorScroll({
            vendorTag: vendorTag,
            lockInSignal: lockInSignal,
            exitAction: exitAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
