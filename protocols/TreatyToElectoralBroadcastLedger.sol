// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToElectoralBroadcastLedger {
    string public batchID = "1321.9.113";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 electionKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event ElectoralBroadcast(bytes32 indexed electionKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastElection(bytes32 electionKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[electionKey] = Broadcast(electionKey, message, evidenceHash, block.timestamp, true);
        emit ElectoralBroadcast(electionKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 electionKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[electionKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
