// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerSovereigntyBroadcastTreaty {
    address public steward;

    struct Broadcast {
        string farmerName;
        string barangay;
        string cropType;
        uint256 yield;
        string emotionalTag;
        string timestamp;
    }

    Broadcast[] public broadcasts;

    event SovereigntyBroadcasted(string farmerName, string barangay, string cropType, uint256 yield, string emotionalTag, string timestamp);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastSovereignty(
        string memory farmerName,
        string memory barangay,
        string memory cropType,
        uint256 yield,
        string memory emotionalTag,
        string memory timestamp
    ) public onlySteward {
        broadcasts.push(Broadcast(farmerName, barangay, cropType, yield, emotionalTag, timestamp));
        emit SovereigntyBroadcasted(farmerName, barangay, cropType, yield, emotionalTag, timestamp);
    }
}
