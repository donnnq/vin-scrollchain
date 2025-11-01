// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlavorSovereigntyCodex {
    address public steward;

    struct FlavorTag {
        string dishName;
        string originCorridor;
        string flavorProfile;
        string emotionalTag;
    }

    FlavorTag[] public codex;

    event FlavorTagged(string dishName, string originCorridor, string flavorProfile, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFlavor(
        string memory dishName,
        string memory originCorridor,
        string memory flavorProfile,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(FlavorTag(dishName, originCorridor, flavorProfile, emotionalTag));
        emit FlavorTagged(dishName, originCorridor, flavorProfile, emotionalTag);
    }
}
