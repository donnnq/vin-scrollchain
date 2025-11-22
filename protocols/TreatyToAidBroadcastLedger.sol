// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToAidBroadcastLedger {
    string public batchID = "1321.9.104";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 aidKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event AidBroadcast(bytes32 indexed aidKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastAid(bytes32 aidKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[aidKey] = Broadcast(aidKey, message, evidenceHash, block.timestamp, true);
        emit AidBroadcast(aidKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 aidKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[aidKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
