// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisEquityProtocol {
    address public originator;

    struct EquityScroll {
        string stateTag;
        string corridorTag;
        string reformSignal;
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
        string memory stateTag,
        string memory corridorTag,
        string memory reformSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(EquityScroll({
            stateTag: stateTag,
            corridorTag: corridorTag,
            reformSignal: reformSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
