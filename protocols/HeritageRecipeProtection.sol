// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtection {
    address public steward;

    struct Recipe {
        string dishName;
        string region;
        string ancestralOrigin;
        string ritualNotes;
        bool verified;
    }

    Recipe[] public registry;

    event RecipeTagged(string dishName, string region, string ancestralOrigin);
    event SyntheticClaimBlocked(string attemptedBy);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRecipe(
        string memory dishName,
        string memory region,
        string memory ancestralOrigin,
        string memory ritualNotes,
        bool verified
    ) public onlySteward {
        registry.push(Recipe(dishName, region, ancestralOrigin, ritualNotes, verified));
        emit RecipeTagged(dishName, region, ancestralOrigin);
    }

    function blockSyntheticClaim(string memory attemptedBy) public onlySteward {
        emit SyntheticClaimBlocked(attemptedBy);
    }
}
