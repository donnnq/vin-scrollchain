// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RailwayLaborJusticeBroadcast {
    address public steward;

    struct JusticeEntry {
        string unionName;
        string grievanceType;
        string justiceDemand;
        string emotionalTag;
    }

    JusticeEntry[] public registry;

    event RailwayJusticeBroadcasted(string unionName, string grievanceType, string justiceDemand, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastJustice(
        string memory unionName,
        string memory grievanceType,
        string memory justiceDemand,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(JusticeEntry(unionName, grievanceType, justiceDemand, emotionalTag));
        emit RailwayJusticeBroadcasted(unionName, grievanceType, justiceDemand, emotionalTag);
    }
}
