// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToServiceBroadcastLedger {
    string public batchID = "1321.9.116";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 serviceKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event ServiceBroadcast(bytes32 indexed serviceKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastService(bytes32 serviceKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[serviceKey] = Broadcast(serviceKey, message, evidenceHash, block.timestamp, true);
        emit ServiceBroadcast(serviceKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 serviceKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[serviceKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
