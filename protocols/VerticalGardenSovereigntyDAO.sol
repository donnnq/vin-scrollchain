// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VerticalGardenSovereigntyDAO {
    address public steward;

    struct GardenEntry {
        string location;
        string plantType;
        string installationPartner;
        string emotionalTag;
    }

    GardenEntry[] public registry;

    event GardenTagged(string location, string plantType, string installationPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagGarden(
        string memory location,
        string memory plantType,
        string memory installationPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(GardenEntry(location, plantType, installationPartner, emotionalTag));
        emit GardenTagged(location, plantType, installationPartner, emotionalTag);
    }
}
