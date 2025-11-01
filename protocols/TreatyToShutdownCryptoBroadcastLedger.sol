// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToShutdownCryptoBroadcastLedger {
    string public batchID = "1321.9.92";
    string public steward = "Vinvin";

    struct Broadcast {
        string topic;
        string source;
        bool emotionallyTagged;
    }

    mapping(string => Broadcast) public broadcastLog;

    function logBroadcast(
        string memory topic,
        string memory source
    ) public {
        broadcastLog[topic] = Broadcast(topic, source, true);
    }

    function getSource(string memory topic) public view returns (string memory) {
        return broadcastLog[topic].source;
    }
}
