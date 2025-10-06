// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FermentationGuildProtocol {
    address public originator;

    struct FermentScroll {
        string fermentTag;
        string baseIngredient;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FermentScroll[] public fermentationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFermentScroll(
        string memory fermentTag,
        string memory baseIngredient,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        fermentationLedger.push(FermentScroll({
            fermentTag: fermentTag,
            baseIngredient: baseIngredient,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
