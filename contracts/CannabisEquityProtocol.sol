// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisEquityProtocol {
    address public originator;

    struct CannabisScroll {
        string regionTag;
        string policySignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CannabisScroll[] public cannabisLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCannabisScroll(
        string memory regionTag,
        string memory policySignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        cannabisLedger.push(CannabisScroll({
            regionTag: regionTag,
            policySignal: policySignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
