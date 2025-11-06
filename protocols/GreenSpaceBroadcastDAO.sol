// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreenSpaceBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string barangay;
        string parkProposal;
        string civicMessage;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event GreenSpaceBroadcasted(string barangay, string parkProposal, string civicMessage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastGreenSpace(
        string memory barangay,
        string memory parkProposal,
        string memory civicMessage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(barangay, parkProposal, civicMessage, emotionalTag));
        emit GreenSpaceBroadcasted(barangay, parkProposal, civicMessage, emotionalTag);
    }
}
