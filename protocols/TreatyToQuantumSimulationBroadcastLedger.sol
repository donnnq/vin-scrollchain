// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToQuantumSimulationBroadcastLedger {
    string public batchID = "1321.9.99";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 simKey;
        string message;
        string evidenceHash; // IPFS/sha256 reference
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event SimulationBroadcast(bytes32 indexed simKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastResult(bytes32 simKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[simKey] = Broadcast(simKey, message, evidenceHash, block.timestamp, true);
        emit SimulationBroadcast(simKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 simKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[simKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
