// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TenantRightsBroadcastDAO {
    address public steward;

    struct RightsEntry {
        string housingProject;
        string tenantRight;
        string civicMessage;
        string emotionalTag;
    }

    RightsEntry[] public registry;

    event TenantRightBroadcasted(string housingProject, string tenantRight, string civicMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastRight(
        string memory housingProject,
        string memory tenantRight,
        string memory civicMessage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RightsEntry(housingProject, tenantRight, civicMessage, emotionalTag));
        emit TenantRightBroadcasted(housingProject, tenantRight, civicMessage, emotionalTag);
    }
}
