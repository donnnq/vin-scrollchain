// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SignalSurgeLedgerDAO {
    address public originator;

    struct SurgeScroll {
        string assetTag;
        string surgeSignal;
        uint256 priceChange;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SurgeScroll[] public surgeLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSurgeScroll(
        string memory assetTag,
        string memory surgeSignal,
        uint256 priceChange,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        surgeLedger.push(SurgeScroll({
            assetTag: assetTag,
            surgeSignal: surgeSignal,
            priceChange: priceChange,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
