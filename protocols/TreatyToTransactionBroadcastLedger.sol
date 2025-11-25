// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToTransactionBroadcastLedger {
    string public batchID = "1321.9.117";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 partnershipKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event TransactionBroadcast(bytes32 indexed partnershipKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastTransaction(bytes32 partnershipKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[partnershipKey] = Broadcast(partnershipKey, message, evidenceHash, block.timestamp, true);
        emit TransactionBroadcast(partnershipKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 partnershipKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[partnershipKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
