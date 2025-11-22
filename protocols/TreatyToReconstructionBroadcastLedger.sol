// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToReconstructionBroadcastLedger {
    string public batchID = "1321.9.106";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 projectKey;
        string milestone;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event ProjectBroadcast(bytes32 indexed projectKey, string milestone, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastMilestone(bytes32 projectKey, string memory milestone, string memory evidenceHash) public onlyAdmin {
        broadcastLog[projectKey] = Broadcast(projectKey, milestone, evidenceHash, block.timestamp, true);
        emit ProjectBroadcast(projectKey, milestone, evidenceHash);
    }

    function getBroadcast(bytes32 projectKey)
        public
        view
        returns (string memory milestone, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[projectKey];
        return (b.milestone, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
