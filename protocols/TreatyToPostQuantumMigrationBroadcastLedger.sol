// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPostQuantumMigrationBroadcastLedger {
    string public batchID = "1321.9.98";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        address validator;
        string message;
        string evidenceHash; // IPFS/sha256 reference
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event MigrationBroadcast(bytes32 indexed key, address indexed validator, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastMigration(address validator, string memory message, string memory evidenceHash) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(validator, block.timestamp, evidenceHash));
        broadcastLog[key] = Broadcast(validator, message, evidenceHash, block.timestamp, true);
        emit MigrationBroadcast(key, validator, message, evidenceHash);
    }

    function getBroadcast(bytes32 key)
        public
        view
        returns (address validator, string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[key];
        return (b.validator, b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
