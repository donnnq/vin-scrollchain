// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalEnergySovereigntyDAO {
    address public steward;

    struct SovereigntyEntry {
        string country;
        string energyProtocol;
        string independenceScore;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event EnergySovereigntyBroadcasted(string country, string energyProtocol, string independenceScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastSovereignty(
        string memory country,
        string memory energyProtocol,
        string memory independenceScore,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(country, energyProtocol, independenceScore, emotionalTag));
        emit EnergySovereigntyBroadcasted(country, energyProtocol, independenceScore, emotionalTag);
    }
}
