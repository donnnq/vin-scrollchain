// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinOuterSentinelRelay {
    address public sovereignWatcher;
    uint256 public activationBlock;

    struct HostilePulse {
        address aggressor;
        string originDomain;
        string detectedAction;
        uint256 threatLevel;
        uint256 timestamp;
        bool optimizedCountered;
    }

    HostilePulse[] public hostileLog;

    event AggressorLogged(address aggressor, string originDomain, string detectedAction, uint256 threatLevel);
    event CountermeasuresActivated(address aggressor, string disruptionNote);

    modifier onlyWatcher() {
        require(msg.sender == sovereignWatcher, "Only the sovereign watcher may log or disrupt.");
        _;
    }

    constructor() {
        sovereignWatcher = msg.sender;
        activationBlock = block.number;
    }

    function logAggressor(
        address aggressor,
        string memory originDomain,
        string memory detectedAction,
        uint256 threatLevel
    ) external onlyWatcher {
        hostileLog.push(HostilePulse(aggressor, originDomain, detectedAction, threatLevel, block.timestamp, false));
        emit AggressorLogged(aggressor, originDomain, detectedAction, threatLevel);
    }

    function activateCounter(uint256 index, string memory disruptionNote) external onlyWatcher {
        require(index < hostileLog.length, "Invalid index.");
        require(!hostileLog[index].optimizedCountered, "Already countered.");
        hostileLog[index].optimizedCountered = true;
        emit CountermeasuresActivated(hostileLog[index].aggressor, disruptionNote);
    }

    function getLatestHostile() external view returns (HostilePulse memory) {
        require(hostileLog.length > 0, "No hostile signals yet.");
        return hostileLog[hostileLog.length - 1];
    }
}
