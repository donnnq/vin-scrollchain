// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToInsiderIncidentBroadcastLedger {
    string public batchID = "1321.9.94";
    string public steward = "Vinvin";

    address public admin;

    struct Incident {
        address subject;
        string description;
        string evidenceHash; // IPFS/sha256 reference to screenshots/logs
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Incident) public incidentLog; // key = hash of (subject + timestamp)

    event IncidentBroadcast(bytes32 indexed key, address indexed subject, string evidenceHash, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastIncident(
        address subject,
        string memory description,
        string memory evidenceHash
    ) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(subject, block.timestamp, evidenceHash));
        incidentLog[key] = Incident(subject, description, evidenceHash, block.timestamp, true);
        emit IncidentBroadcast(key, subject, evidenceHash, description);
    }

    function getIncident(bytes32 key)
        public
        view
        returns (address subject, string memory description, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Incident memory i = incidentLog[key];
        return (i.subject, i.description, i.evidenceHash, i.timestamp, i.broadcasted);
    }
}
