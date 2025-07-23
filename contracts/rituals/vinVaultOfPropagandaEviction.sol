// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfPropagandaEviction {
    address public scrollkeeper;

    struct EvictionLog {
        string outletName;
        string country;
        string reason;
        uint256 timestamp;
    }

    EvictionLog[] public logs;

    event PropagandaEvicted(string outletName, string reason);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logEviction(string memory outletName, string memory country, string memory reason) external onlyScrollkeeper {
        logs.push(EvictionLog(outletName, country, reason, block.timestamp));
        emit PropagandaEvicted(outletName, reason);
    }

    function getEviction(uint256 index) external view returns (string memory, string memory, string memory, uint256) {
        EvictionLog memory e = logs[index];
        return (e.outletName, e.country, e.reason, e.timestamp);
    }

    function totalEvictions() external view returns (uint256) {
        return logs.length;
    }
}
