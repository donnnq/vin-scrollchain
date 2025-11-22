// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToExchangeBroadcastLedger {
    string public batchID = "1321.9.111";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 exchangeKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event ExchangeBroadcast(bytes32 indexed exchangeKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastExchange(bytes32 exchangeKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[exchangeKey] = Broadcast(exchangeKey, message, evidenceHash, block.timestamp, true);
        emit ExchangeBroadcast(exchangeKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 exchangeKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[exchangeKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
