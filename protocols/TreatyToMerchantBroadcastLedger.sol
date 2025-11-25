// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToMerchantBroadcastLedger {
    string public batchID = "1321.9.119";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 merchantKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event MerchantBroadcast(bytes32 indexed merchantKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastMerchant(bytes32 merchantKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[merchantKey] = Broadcast(merchantKey, message, evidenceHash, block.timestamp, true);
        emit MerchantBroadcast(merchantKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 merchantKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[merchantKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
