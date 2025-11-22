// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToSignalBroadcastLedger {
    string public batchID = "1321.9.110";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 signalKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event SignalBroadcast(bytes32 indexed signalKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastSignal(bytes32 signalKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[signalKey] = Broadcast(signalKey, message, evidenceHash, block.timestamp, true);
        emit SignalBroadcast(signalKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 signalKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[signalKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
