// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayResilienceBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string barangay;
        string resilienceProtocol;
        string communityRole;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event ResilienceBroadcasted(string barangay, string resilienceProtocol, string communityRole, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastResilience(
        string memory barangay,
        string memory resilienceProtocol,
        string memory communityRole,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(barangay, resilienceProtocol, communityRole, emotionalTag));
        emit ResilienceBroadcasted(barangay, resilienceProtocol, communityRole, emotionalTag);
    }
}
