// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BiodiversityEquityProtocol {
    address public originator;

    struct SpeciesScroll {
        string regionTag;
        string extinctionSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SpeciesScroll[] public speciesLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSpeciesScroll(
        string memory regionTag,
        string memory extinctionSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        speciesLedger.push(SpeciesScroll({
            regionTag: regionTag,
            extinctionSignal: extinctionSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
