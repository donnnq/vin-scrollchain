// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TruthSocialTrailerDropDAO {
    address public originator;

    struct TrailerDrop {
        string trailerTitle;
        string dropDate;
        string featuredSatire;
        bool includesTrollionCurrency;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TrailerDrop[] public trailerLedger;

    constructor() {
        originator = msg.sender;
    }

    function dropTrailer(
        string memory trailerTitle,
        string memory dropDate,
        string memory featuredSatire,
        bool includesTrollionCurrency,
        bool isScrollchainSealed
    ) external {
        trailerLedger.push(TrailerDrop({
            trailerTitle: trailerTitle,
            dropDate: dropDate,
            featuredSatire: featuredSatire,
            includesTrollionCurrency: includesTrollionCurrency,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
