// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongregationalFreedomIndex {
    address public steward;

    struct FreedomEntry {
        string organization;
        string autonomyScore;
        string pressureLevel;
        string emotionalTag;
    }

    FreedomEntry[] public index;

    event CongregationalFreedomTagged(string organization, string autonomyScore, string pressureLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFreedom(
        string memory organization,
        string memory autonomyScore,
        string memory pressureLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(FreedomEntry(organization, autonomyScore, pressureLevel, emotionalTag));
        emit CongregationalFreedomTagged(organization, autonomyScore, pressureLevel, emotionalTag);
    }
}
