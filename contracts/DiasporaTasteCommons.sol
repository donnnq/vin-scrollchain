// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiasporaTasteCommons {
    address public originator;

    struct TasteScroll {
        string dishTag;
        string originRegion;
        string diasporaSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TasteScroll[] public tasteLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTasteScroll(
        string memory dishTag,
        string memory originRegion,
        string memory diasporaSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        tasteLedger.push(TasteScroll({
            dishTag: dishTag,
            originRegion: originRegion,
            diasporaSignal: diasporaSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
