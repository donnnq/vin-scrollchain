// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToRailsBroadcastLedger {
    string public batchID = "1321.9.118";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 railKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event RailsBroadcast(bytes32 indexed railKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastRail(bytes32 railKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[railKey] = Broadcast(railKey, message, evidenceHash, block.timestamp, true);
        emit RailsBroadcast(railKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 railKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[railKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
