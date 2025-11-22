// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToRecoveryBroadcastLedger {
    string public batchID = "1321.9.100";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 recoveryKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event RecoveryBroadcast(bytes32 indexed recoveryKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastRecovery(bytes32 recoveryKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[recoveryKey] = Broadcast(recoveryKey, message, evidenceHash, block.timestamp, true);
        emit RecoveryBroadcast(recoveryKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 recoveryKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[recoveryKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
