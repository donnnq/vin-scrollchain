// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedStateExpansionBroadcastDAO {
    address public steward;

    struct ExpansionEntry {
        string stateName;
        string incomingBusiness;
        string supportProtocol;
        string emotionalTag;
    }

    ExpansionEntry[] public registry;

    event RedStateExpansionBroadcasted(string stateName, string incomingBusiness, string supportProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastExpansion(
        string memory stateName,
        string memory incomingBusiness,
        string memory supportProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ExpansionEntry(stateName, incomingBusiness, supportProtocol, emotionalTag));
        emit RedStateExpansionBroadcasted(stateName, incomingBusiness, supportProtocol, emotionalTag);
    }
}
