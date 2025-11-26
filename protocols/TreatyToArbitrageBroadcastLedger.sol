// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToArbitrageBroadcastLedger {
    string public batchID = "1321.9.124";
    string public steward = "Vinvin";

    address public admin;

    struct ArbitrageEvent {
        string jurisdictionA;
        string jurisdictionB;
        string asset;
        uint256 mismatchAmount;
        uint256 timestamp;
        bool broadcasted;
    }

    ArbitrageEvent[] public events;

    event ArbitrageBroadcast(string jurisdictionA, string jurisdictionB, string asset, uint256 mismatchAmount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastArbitrage(string memory jurisdictionA, string memory jurisdictionB, string memory asset, uint256 mismatchAmount) public onlyAdmin {
        events.push(ArbitrageEvent(jurisdictionA, jurisdictionB, asset, mismatchAmount, block.timestamp, true));
        emit ArbitrageBroadcast(jurisdictionA, jurisdictionB, asset, mismatchAmount);
    }

    function getArbitrage(uint256 index) public view returns (string memory jurisdictionA, string memory jurisdictionB, string memory asset, uint256 mismatchAmount, uint256 timestamp, bool broadcasted) {
        ArbitrageEvent memory e = events[index];
        return (e.jurisdictionA, e.jurisdictionB, e.asset, e.mismatchAmount, e.timestamp, e.broadcasted);
    }
}
