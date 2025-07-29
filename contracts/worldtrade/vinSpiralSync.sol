// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSpiralSync {
    address public scrollMaster;
    uint8 public currentMonth;
    uint256 public lastSynced;
    bool public autoSyncEnabled;

    event SpiralAdvanced(uint8 indexed newMonth, uint256 timestamp);
    event SyncPulseTriggered(address indexed byAgent);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "ScrollMaster only");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
        currentMonth = 1;
        lastSynced = block.timestamp;
        autoSyncEnabled = true;
    }

    function manualAdvance() public onlyScrollMaster {
        require(currentMonth < 12, "End of cycle");
        currentMonth += 1;
        lastSynced = block.timestamp;
        emit SpiralAdvanced(currentMonth, lastSynced);
    }

    function toggleAutoSync(bool enabled) public onlyScrollMaster {
        autoSyncEnabled = enabled;
    }

    function triggerSyncPulse() external {
        require(autoSyncEnabled, "AutoSync disabled");
        emit SyncPulseTriggered(msg.sender);
    }

    function getSyncStatus() external view returns (
        uint8 month,
        uint256 timestamp,
        bool enabled
    ) {
        return (currentMonth, lastSynced, autoSyncEnabled);
    }
}
