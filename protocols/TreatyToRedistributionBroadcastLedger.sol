// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToRedistributionBroadcastLedger {
    string public batchID = "1321.9.115";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 redistributionKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event RedistributionBroadcast(bytes32 indexed redistributionKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastRedistribution(bytes32 redistributionKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[redistributionKey] = Broadcast(redistributionKey, message, evidenceHash, block.timestamp, true);
        emit RedistributionBroadcast(redistributionKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 redistributionKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[redistributionKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
