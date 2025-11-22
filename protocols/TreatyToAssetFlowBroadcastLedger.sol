// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToAssetFlowBroadcastLedger {
    string public batchID = "1321.9.102";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 assetKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event AssetFlowBroadcast(bytes32 indexed assetKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastAssetFlow(bytes32 assetKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[assetKey] = Broadcast(assetKey, message, evidenceHash, block.timestamp, true);
        emit AssetFlowBroadcast(assetKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 assetKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[assetKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
