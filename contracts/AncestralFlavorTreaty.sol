// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AncestralFlavorTreaty {
    address public originator;

    struct FlavorScroll {
        string recipeTag;
        string culturalOrigin;
        string diasporaSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FlavorScroll[] public flavorLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFlavorScroll(
        string memory recipeTag,
        string memory culturalOrigin,
        string memory diasporaSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        flavorLedger.push(FlavorScroll({
            recipeTag: recipeTag,
            culturalOrigin: culturalOrigin,
            diasporaSignal: diasporaSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
