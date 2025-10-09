// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalFoodDeployment {
    address public originator;

    struct FoodScroll {
        string productTag;
        string regionTag;
        string exportSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FoodScroll[] public foodLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFoodScroll(
        string memory productTag,
        string memory regionTag,
        string memory exportSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        foodLedger.push(FoodScroll({
            productTag: productTag,
            regionTag: regionTag,
            exportSignal: exportSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
