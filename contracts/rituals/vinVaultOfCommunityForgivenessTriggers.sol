// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfCommunityForgivenessTriggers {
    address public scrollkeeper;

    struct ForgivenessLog {
        string initiator;
        string forgivenParty;
        string reason;
        uint256 timestamp;
    }

    ForgivenessLog[] public logs;

    event ForgivenessDeclared(string initiator, string forgivenParty);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function declareForgiveness(string memory initiator, string memory forgivenParty, string memory reason) external onlyScrollkeeper {
        logs.push(ForgivenessLog(initiator, forgivenParty, reason, block.timestamp));
        emit ForgivenessDeclared(initiator, forgivenParty);
    }

    function getForgivenessLog(uint256 index) external view returns (string memory, string memory, string memory, uint256) {
        ForgivenessLog memory f = logs[index];
        return (f.initiator, f.forgivenParty, f.reason, f.timestamp);
    }

    function totalForgivenessLogs() external view returns (uint256) {
        return logs.length;
    }
}
