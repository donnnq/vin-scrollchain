// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthCommissionBroadcastManifest {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string commissionName;
        string abuseType;
        string broadcastChannel;
        string civicReckoningSignal;
        string emotionalTag;
    }

    BroadcastEntry[] public manifest;

    event TruthCommissionBroadcasted(string timestamp, string commissionName, string abuseType, string broadcastChannel, string civicReckoningSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastTruth(
        string memory timestamp,
        string memory commissionName,
        string memory abuseType,
        string memory broadcastChannel,
        string memory civicReckoningSignal,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(BroadcastEntry(timestamp, commissionName, abuseType, broadcastChannel, civicReckoningSignal, emotionalTag));
        emit TruthCommissionBroadcasted(timestamp, commissionName, abuseType, broadcastChannel, civicReckoningSignal, emotionalTag);
    }
}
