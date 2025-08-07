// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinScrollForgeEvent {
    address public scrollMaster;
    uint256 public totalForgings;

    struct ScrollEvent {
        uint256 eventId;
        address forger;
        string scrollName;
        string ritualPhrase;
        uint256 timestamp;
    }

    mapping(uint256 => ScrollEvent) public events;

    event ScrollForged(
        uint256 indexed eventId,
        address indexed forger,
        string scrollName,
        string ritualPhrase,
        uint256 timestamp
    );

    modifier onlyMaster() {
        require(msg.sender == scrollMaster, "Not authorized scroll master");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function forgeScroll(string memory scrollName, string memory ritualPhrase) external onlyMaster {
        events[totalForgings] = ScrollEvent(
            totalForgings,
            msg.sender,
            scrollName,
            ritualPhrase,
            block.timestamp
        );

        emit ScrollForged(totalForgings, msg.sender, scrollName, ritualPhrase, block.timestamp);
        totalForgings++;
    }

    function updateScrollMaster(address newMaster) external onlyMaster {
        scrollMaster = newMaster;
    }
}
