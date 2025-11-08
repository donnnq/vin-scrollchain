// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAccountabilityBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string officialOrAgency;
        string accountabilityDemand;
        string civicResponseSignal;
        string emotionalTag;
    }

    BroadcastEntry[] public protocol;

    event AccountabilityBroadcasted(string timestamp, string officialOrAgency, string accountabilityDemand, string civicResponseSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastAccountability(
        string memory timestamp,
        string memory officialOrAgency,
        string memory accountabilityDemand,
        string memory civicResponseSignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(BroadcastEntry(timestamp, officialOrAgency, accountabilityDemand, civicResponseSignal, emotionalTag));
        emit AccountabilityBroadcasted(timestamp, officialOrAgency, accountabilityDemand, civicResponseSignal, emotionalTag);
    }
}
