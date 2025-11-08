// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthReparationsBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string reparationsType;
        string beneficiaryGroup;
        string broadcastChannel;
        string justiceSignal;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event ReparationsBroadcasted(string timestamp, string reparationsType, string beneficiaryGroup, string broadcastChannel, string justiceSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastReparations(
        string memory timestamp,
        string memory reparationsType,
        string memory beneficiaryGroup,
        string memory broadcastChannel,
        string memory justiceSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(timestamp, reparationsType, beneficiaryGroup, broadcastChannel, justiceSignal, emotionalTag));
        emit ReparationsBroadcasted(timestamp, reparationsType, beneficiaryGroup, broadcastChannel, justiceSignal, emotionalTag);
    }
}
