// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnergyIndependenceBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string country;
        string energyMilestone;
        string independenceLevel;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event EnergyIndependenceBroadcasted(string country, string energyMilestone, string independenceLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastIndependence(
        string memory country,
        string memory energyMilestone,
        string memory independenceLevel,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(country, energyMilestone, independenceLevel, emotionalTag));
        emit EnergyIndependenceBroadcasted(country, energyMilestone, independenceLevel, emotionalTag);
    }
}
