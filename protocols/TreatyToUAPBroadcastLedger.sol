// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToUAPBroadcastLedger {
    string public batchID = "1321.9.107";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 evidenceKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event UAPBroadcast(bytes32 indexed evidenceKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastEvidence(bytes32 evidenceKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[evidenceKey] = Broadcast(evidenceKey, message, evidenceHash, block.timestamp, true);
        emit UAPBroadcast(evidenceKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 evidenceKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[evidenceKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
