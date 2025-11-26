// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToStablecoinRunBroadcastLedger {
    string public batchID = "1321.9.123";
    string public steward = "Vinvin";

    address public admin;

    struct RunEvent {
        string issuer;
        uint256 redemptionAmount;
        string reserveAsset;
        uint256 timestamp;
        bool broadcasted;
    }

    RunEvent[] public runs;

    event RunBroadcast(string issuer, uint256 redemptionAmount, string reserveAsset);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastRun(string memory issuer, uint256 redemptionAmount, string memory reserveAsset) public onlyAdmin {
        runs.push(RunEvent(issuer, redemptionAmount, reserveAsset, block.timestamp, true));
        emit RunBroadcast(issuer, redemptionAmount, reserveAsset);
    }

    function getRun(uint256 index) public view returns (string memory issuer, uint256 redemptionAmount, string memory reserveAsset, uint256 timestamp, bool broadcasted) {
        RunEvent memory r = runs[index];
        return (r.issuer, r.redemptionAmount, r.reserveAsset, r.timestamp, r.broadcasted);
    }
}
