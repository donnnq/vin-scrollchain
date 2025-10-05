// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FlexibleOccupancyProtocol {
    address public originator;

    struct OccupancyScroll {
        string propertyTag;
        string moveInStatus;
        string paymentFlexibility;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OccupancyScroll[] public occupancyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOccupancyScroll(
        string memory propertyTag,
        string memory moveInStatus,
        string memory paymentFlexibility,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        occupancyLedger.push(OccupancyScroll({
            propertyTag: propertyTag,
            moveInStatus: moveInStatus,
            paymentFlexibility: paymentFlexibility,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
