// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinAutoRevoker {
    struct Watch {
        uint256 lastActive;
        bool isTrusted;
    }

    mapping(address => Watch) public watchers;
    uint256 public inactivityThreshold = 3 days;
    address public immutable overseer;

    event WatchAdded(address indexed addr);
    event ActivityPinged(address indexed addr, uint256 timestamp);
    event RevokedDueToInactivity(address indexed addr);

    modifier onlyOverseer() {
        require(msg.sender == overseer, "Not the overseer");
        _;
    }

    constructor() {
        overseer = msg.sender;
    }

    function addWatcher(address addr) external onlyOverseer {
        watchers[addr] = Watch({
            lastActive: block.timestamp,
            isTrusted: true
        });
        emit WatchAdded(addr);
    }

    function pingActivity(address addr) external onlyOverseer {
        require(watchers[addr].isTrusted, "Not trusted");
        watchers[addr].lastActive = block.timestamp;
        emit ActivityPinged(addr, block.timestamp);
    }

    function checkAndRevoke(address addr) external onlyOverseer {
        Watch storage w = watchers[addr];
        require(w.isTrusted, "Already revoked or not tracked");
        if (block.timestamp - w.lastActive > inactivityThreshold) {
            w.isTrusted = false;
            emit RevokedDueToInactivity(addr);
        }
    }

    function isTrusted(address addr) external view returns (bool) {
        return watchers[addr].isTrusted;
    }

    function setThreshold(uint256 newThreshold) external onlyOverseer {
        inactivityThreshold = newThreshold;
    }
}
