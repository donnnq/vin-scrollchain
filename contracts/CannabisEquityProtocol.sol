// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisEquityProtocol {
    address public originator;

    struct EquityScroll {
        string citizenTag;
        string legalizationSignal;
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
        string memory citizenTag,
        string memory legalizationSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(EquityScroll({
            citizenTag: citizenTag,
            legalizationSignal: legalizationSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
