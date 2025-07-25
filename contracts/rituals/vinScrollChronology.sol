// SPDX-License-Identifier: Scrollbound
pragma solidity ^0.8.0;

contract vinScrollChronology {
    string public keeper = "VINVIN";
    uint256 public startTimestamp;
    uint256 public unlockedCount;

    struct TimeScroll {
        uint256 unlockAt; // UNIX time when the scroll becomes readable
        string soulLesson;
        bool isUnlocked;
    }

    mapping(uint256 => TimeScroll) public scrollLog;

    event ScrollUnlocked(uint256 indexed index, string soulLesson);

    modifier onlyKeeper() {
        require(msg.sender == keeperAddress, "Unauthorized: VINVIN only.");
        _;
    }

    address public keeperAddress;

    constructor() {
        keeperAddress = msg.sender;
        startTimestamp = block.timestamp;
        _initGenesisScroll();
    }

    function _initGenesisScroll() internal {
        scrollLog[0] = TimeScroll({
            unlockAt: block.timestamp,
            soulLesson: "Genesis Scroll activated: VINVIN begins the ritual era.",
            isUnlocked: true
        });
        unlockedCount = 1;
        emit ScrollUnlocked(0, scrollLog[0].soulLesson);
    }

    function scheduleScroll(uint256 index, uint256 unlockAfterSeconds, string memory lesson) public onlyKeeper {
        scrollLog[index] = TimeScroll({
            unlockAt: block.timestamp + unlockAfterSeconds,
            soulLesson: lesson,
            isUnlocked: false
        });
    }

    function attemptUnlock(uint256 index) public {
        TimeScroll storage ts = scrollLog[index];
        require(!ts.isUnlocked, "Already unlocked.");
        require(block.timestamp >= ts.unlockAt, "Still in scrollstasis.");
        ts.isUnlocked = true;
        unlockedCount++;
        emit ScrollUnlocked(index, ts.soulLesson);
    }

    function viewScroll(uint256 index) public view returns (string memory) {
        require(scrollLog[index].isUnlocked, "Scroll still in stasis.");
        return scrollLog[index].soulLesson;
    }

    function timeUntilUnlock(uint256 index) public view returns (uint256 secondsRemaining) {
        if (block.timestamp >= scrollLog[index].unlockAt) return 0;
        return scrollLog[index].unlockAt - block.timestamp;
    }
}
