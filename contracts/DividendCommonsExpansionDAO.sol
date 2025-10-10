// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DividendCommonsExpansionDAO {
    address public originator;

    struct ExpansionScroll {
        string countryTag;
        uint256 dividendAmount;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ExpansionScroll[] public expansionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logExpansionScroll(
        string memory countryTag,
        uint256 dividendAmount,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        expansionLedger.push(ExpansionScroll({
            countryTag: countryTag,
            dividendAmount: dividendAmount,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
