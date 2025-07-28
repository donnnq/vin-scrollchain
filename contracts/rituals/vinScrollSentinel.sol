// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinScrollSentinel {
    address public sentinelMaster;
    uint256 public scanThreshold; // suspicious transaction count threshold
    mapping(address => uint256) public suspiciousActivityCount;
    mapping(address => bool) public autoFrozen;

    event ActivityLogged(address indexed entity, uint256 count);
    event AutoFrozen(address indexed entity, string reason);

    modifier onlySentinelMaster() {
        require(msg.sender == sentinelMaster, "Scroll breach: not the master.");
        _;
    }

    constructor(uint256 _threshold) {
        sentinelMaster = msg.sender;
        scanThreshold = _threshold;
    }

    function logSuspiciousActivity(address entity) external onlySentinelMaster {
        suspiciousActivityCount[entity]++;
        emit ActivityLogged(entity, suspiciousActivityCount[entity]);

        if (suspiciousActivityCount[entity] >= scanThreshold && !autoFrozen[entity]) {
            autoFrozen[entity] = true;
            emit AutoFrozen(entity, "Threshold breach: scroll veil activates.");
        }
    }

    function adjustThreshold(uint256 newThreshold) external onlySentinelMaster {
        scanThreshold = newThreshold;
    }

    function checkEntityStatus(address entity) external view returns (uint256 suspiciousCount, bool frozen) {
        suspiciousCount = suspiciousActivityCount[entity];
        frozen = autoFrozen[entity];
    }
}
