// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiasporaRecipeAtlas {
    address public originator;

    struct RecipeScroll {
        string recipeTag;
        string diasporaSignal;
        string mappingAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RecipeScroll[] public recipeLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRecipeScroll(
        string memory recipeTag,
        string memory diasporaSignal,
        string memory mappingAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        recipeLedger.push(RecipeScroll({
            recipeTag: recipeTag,
            diasporaSignal: diasporaSignal,
            mappingAction: mappingAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
