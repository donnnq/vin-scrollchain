// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToQuantumReadinessBroadcastLedger {
    string public batchID = "1321.9.97";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        string message;
        string evidenceHash; // IPFS/sha256 reference
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event QuantumBroadcast(bytes32 indexed key, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastReadiness(string memory message, string memory evidenceHash) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(message, block.timestamp, evidenceHash));
        broadcastLog[key] = Broadcast(message, evidenceHash, block.timestamp, true);
        emit QuantumBroadcast(key, message, evidenceHash);
    }

    function getBroadcast(bytes32 key)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[key];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
