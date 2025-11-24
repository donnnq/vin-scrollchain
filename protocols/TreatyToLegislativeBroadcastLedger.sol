// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToLegislativeBroadcastLedger {
    string public batchID = "1321.9.112";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 ruleKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event LegislativeBroadcast(bytes32 indexed ruleKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastRule(bytes32 ruleKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[ruleKey] = Broadcast(ruleKey, message, evidenceHash, block.timestamp, true);
        emit LegislativeBroadcast(ruleKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 ruleKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[ruleKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
