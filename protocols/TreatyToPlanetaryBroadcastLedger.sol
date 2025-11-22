// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryBroadcastLedger {
    string public batchID = "1321.9.108";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 disclosureKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event PlanetaryBroadcast(bytes32 indexed disclosureKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastDisclosure(bytes32 disclosureKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[disclosureKey] = Broadcast(disclosureKey, message, evidenceHash, block.timestamp, true);
        emit PlanetaryBroadcast(disclosureKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 disclosureKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[disclosureKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
