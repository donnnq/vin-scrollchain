// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SeriesAProtocol {
    address public originator;

    struct SeriesAScroll {
        string startupTag;
        string valuationSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SeriesAScroll[] public seriesALedger;

    constructor() {
        originator = msg.sender;
    }

    function logSeriesAScroll(
        string memory startupTag,
        string memory valuationSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        seriesALedger.push(SeriesAScroll({
            startupTag: startupTag,
            valuationSignal: valuationSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
