// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HearingToOversightRestorationGrid {
    address public steward;

    struct HearingEntry {
        string topic; // "DPWH flood control irregularities"
        string clause; // "Scrollchain-sealed grid for oversight restoration and planetary consequence"
        string emotionalTag;
        bool resumed;
        bool sealed;
    }

    HearingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function resumeHearing(string memory topic, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(HearingEntry(topic, clause, emotionalTag, true, false));
    }

    function sealHearingEntry(uint256 index) external onlySteward {
        require(entries[index].resumed, "Must be resumed first");
        entries[index].sealed = true;
    }

    function getHearingEntry(uint256 index) external view returns (HearingEntry memory) {
        return entries[index];
    }
}
