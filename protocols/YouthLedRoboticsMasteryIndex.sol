// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLedRoboticsMasteryIndex {
    address public steward;

    struct MasteryEntry {
        string barangay;
        string roboticsDomain;
        string masteryScore;
        string emotionalTag;
    }

    MasteryEntry[] public index;

    event RoboticsMasteryIndexed(string barangay, string roboticsDomain, string masteryScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexMastery(
        string memory barangay,
        string memory roboticsDomain,
        string memory masteryScore,
        string memory emotionalTag
    ) public onlySteard {
        index.push(MasteryEntry(barangay, roboticsDomain, masteryScore, emotionalTag));
        emit RoboticsMasteryIndexed(barangay, roboticsDomain, masteryScore, emotionalTag);
    }
}
