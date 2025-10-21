// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhiteHouseReformTimelineCodex {
    address public admin;

    struct TimelineEntry {
        string reformType; // "Cannabis Rescheduling", "Banking Reform", "Criminal Justice"
        string milestone; // "Announcement", "Directive", "Implementation"
        string status; // "Promised", "Delayed", "Unfulfilled"
        string emotionalTag;
        bool summoned;
        bool timestamped;
        bool sealed;
    }

    TimelineEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTimeline(string memory reformType, string memory milestone, string memory status, string memory emotionalTag) external onlyAdmin {
        entries.push(TimelineEntry(reformType, milestone, status, emotionalTag, true, false, false));
    }

    function confirmTimestamp(uint256 index) external onlyAdmin {
        entries[index].timestamped = true;
    }

    function sealTimelineEntry(uint256 index) external onlyAdmin {
        require(entries[index].timestamped, "Must be timestamped first");
        entries[index].sealed = true;
    }

    function getTimelineEntry(uint256 index) external view returns (TimelineEntry memory) {
        return entries[index];
    }
}
