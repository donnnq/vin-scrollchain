// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPrivilegeTrapBroadcastLedger {
    string public batchID = "1321.9.96";
    string public steward = "Vinvin";

    address public admin;

    struct TrapEvent {
        address subject;
        bytes32 trapKey;
        string context;
        string evidenceHash; // IPFS/sha256
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => TrapEvent) public trapLog; // key = keccak256(subject, trapKey, timestamp)

    event TrapBroadcast(bytes32 indexed key, address indexed subject, bytes32 indexed trapKey, string evidenceHash, string context);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastTrap(
        address subject,
        bytes32 trapKey,
        string memory context,
        string memory evidenceHash
    ) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(subject, trapKey, block.timestamp, evidenceHash));
        trapLog[key] = TrapEvent(subject, trapKey, context, evidenceHash, block.timestamp, true);
        emit TrapBroadcast(key, subject, trapKey, evidenceHash, context);
    }

    function getTrap(bytes32 key)
        public
        view
        returns (address subject, bytes32 trapKey, string memory context, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        TrapEvent memory t = trapLog[key];
        return (t.subject, t.trapKey, t.context, t.evidenceHash, t.timestamp, t.broadcasted);
    }
}
