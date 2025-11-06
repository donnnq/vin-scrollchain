// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateResilientAqueductBlueprintDAO {
    address public steward;

    struct BlueprintEntry {
        string aqueductName;
        string climateAdaptationFeature;
        string engineeringPrinciple;
        string emotionalTag;
    }

    BlueprintEntry[] public registry;

    event AqueductBlueprintBroadcasted(string aqueductName, string climateAdaptationFeature, string engineeringPrinciple, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastBlueprint(
        string memory aqueductName,
        string memory climateAdaptationFeature,
        string memory engineeringPrinciple,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BlueprintEntry(aqueductName, climateAdaptationFeature, engineeringPrinciple, emotionalTag));
        emit AqueductBlueprintBroadcasted(aqueductName, climateAdaptationFeature, engineeringPrinciple, emotionalTag);
    }
}
