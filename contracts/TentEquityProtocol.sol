// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TentEquityProtocol {
    address public originator;

    struct TentScroll {
        string cityTag;
        string eventType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TentScroll[] public tentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTentScroll(
        string memory cityTag,
        string memory eventType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        tentLedger.push(TentScroll({
            cityTag: cityTag,
            eventType: eventType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
