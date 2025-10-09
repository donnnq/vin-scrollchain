// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiasporaNourishmentCommons {
    address public originator;

    struct NourishmentScroll {
        string dishTag;
        string originRegion;
        string diasporaSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    NourishmentScroll[] public nourishmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logNourishmentScroll(
        string memory dishTag,
        string memory originRegion,
        string memory diasporaSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        nourishmentLedger.push(NourishmentScroll({
            dishTag: dishTag,
            originRegion: originRegion,
            diasporaSignal: diasporaSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
