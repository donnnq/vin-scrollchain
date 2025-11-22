// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToCouncilBroadcastLedger {
    string public batchID = "1321.9.103";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        uint256 decisionIndex;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(uint256 => Broadcast) public broadcastLog;

    event CouncilBroadcast(uint256 indexed decisionIndex, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastDecision(uint256 decisionIndex, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[decisionIndex] = Broadcast(decisionIndex, message, evidenceHash, block.timestamp, true);
        emit CouncilBroadcast(decisionIndex, message, evidenceHash);
    }

    function getBroadcast(uint256 decisionIndex)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[decisionIndex];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
