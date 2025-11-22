// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPreparednessBroadcastLedger {
    string public batchID = "1321.9.109";
    string public steward = "Vinvin";

    address public admin;

    struct Broadcast {
        bytes32 drillKey;
        string message;
        string evidenceHash;
        uint256 timestamp;
        bool broadcasted;
    }

    mapping(bytes32 => Broadcast) public broadcastLog;

    event PreparednessBroadcast(bytes32 indexed drillKey, string message, string evidenceHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastPreparedness(bytes32 drillKey, string memory message, string memory evidenceHash) public onlyAdmin {
        broadcastLog[drillKey] = Broadcast(drillKey, message, evidenceHash, block.timestamp, true);
        emit PreparednessBroadcast(drillKey, message, evidenceHash);
    }

    function getBroadcast(bytes32 drillKey)
        public
        view
        returns (string memory message, string memory evidenceHash, uint256 timestamp, bool broadcasted)
    {
        Broadcast memory b = broadcastLog[drillKey];
        return (b.message, b.evidenceHash, b.timestamp, b.broadcasted);
    }
}
