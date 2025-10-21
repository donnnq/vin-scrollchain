// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisReschedulingDAO {
    address public admin;

    struct RescheduleEntry {
        string agency; // "White House", "DOJ", "DEA"
        string scheduleTarget; // "Schedule III"
        string delayReason; // "Political Tension", "Advisor Resistance", "Strategic Timing"
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    RescheduleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReschedule(string memory agency, string memory scheduleTarget, string memory delayReason, string memory emotionalTag) external onlyAdmin {
        entries.push(RescheduleEntry(agency, scheduleTarget, delayReason, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealRescheduleEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getRescheduleEntry(uint256 index) external view returns (RescheduleEntry memory) {
        return entries[index];
    }
}
