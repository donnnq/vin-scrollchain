// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OceanTreatyBroadcast {
    address public steward;

    struct Treaty {
        string treatyID;
        string corridor;
        string broadcastMessage;
        uint256 timestamp;
    }

    Treaty[] public broadcastLog;

    event TreatyBroadcasted(string treatyID, string corridor, string broadcastMessage, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastTreaty(
        string memory treatyID,
        string memory corridor,
        string memory broadcastMessage
    ) public onlySteward {
        broadcastLog.push(Treaty(treatyID, corridor, broadcastMessage, block.timestamp));
        emit TreatyBroadcasted(treatyID, corridor, broadcastMessage, block.timestamp);
    }
}
