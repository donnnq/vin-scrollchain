 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterCrisisResponseDAO {
    address public steward;

    struct ResponseEntry {
        string region;
        string crisisType;
        string responseProtocol;
        string emotionalTag;
    }

    ResponseEntry[] public registry;

    event WaterCrisisResponseBroadcasted(string region, string crisisType, string responseProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastResponse(
        string memory region,
        string memory crisisType,
        string memory responseProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResponseEntry(region, crisisType, responseProtocol, emotionalTag));
        emit WaterCrisisResponseBroadcasted(region, crisisType, responseProtocol, emotionalTag);
    }
}
