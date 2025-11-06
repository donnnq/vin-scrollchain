// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanBlueprintInspirationRegistry {
    address public steward;

    struct InspirationEntry {
        string ancientSystem;
        string engineeringPrinciple;
        string modernAdaptation;
        string emotionalTag;
    }

    InspirationEntry[] public registry;

    event BlueprintInspired(string ancientSystem, string engineeringPrinciple, string modernAdaptation, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInspiration(
        string memory ancientSystem,
        string memory engineeringPrinciple,
        string memory modernAdaptation,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(InspirationEntry(ancientSystem, engineeringPrinciple, modernAdaptation, emotionalTag));
        emit BlueprintInspired(ancientSystem, engineeringPrinciple, modernAdaptation, emotionalTag);
    }
}
