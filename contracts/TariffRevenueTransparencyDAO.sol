// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TariffRevenueTransparencyDAO {
    address public originator;

    struct RevenueScroll {
        string sourceCountry;
        uint256 amountCollected;
        string commodityTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RevenueScroll[] public revenueLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRevenueScroll(
        string memory sourceCountry,
        uint256 amountCollected,
        string memory commodityTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        revenueLedger.push(RevenueScroll({
            sourceCountry: sourceCountry,
            amountCollected: amountCollected,
            commodityTag: commodityTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
