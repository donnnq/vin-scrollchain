// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToStressBroadcastLedger {
    string public batchID = "1321.9.125";
    string public steward = "Vinvin";

    address public admin;

    struct StressEvent {
        string issuer;
        uint256 redemptionAmount;
        string reserveAsset;
        uint256 timestamp;
        bool broadcasted;
    }

    StressEvent[] public events;

    event StressBroadcast(string issuer, uint256 redemptionAmount, string reserveAsset);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastStress(string memory issuer, uint256 redemptionAmount, string memory reserveAsset) public onlyAdmin {
        events.push(StressEvent(issuer, redemptionAmount, reserveAsset, block.timestamp, true));
        emit StressBroadcast(issuer, redemptionAmount, reserveAsset);
    }

    function getStress(uint256 index) public view returns (string memory issuer, uint256 redemptionAmount, string memory reserveAsset, uint256 timestamp, bool broadcasted) {
        StressEvent memory e = events[index];
        return (e.issuer, e.redemptionAmount, e.reserveAsset, e.timestamp, e.broadcasted);
    }
}
