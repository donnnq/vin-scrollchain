// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommuterDignityIndex {
    address public steward;

    struct DignityEntry {
        string city;
        string transitCondition;
        string dignityScore;
        string emotionalTag;
    }

    DignityEntry[] public index;

    event CommuterDignityTagged(string city, string transitCondition, string dignityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDignity(
        string memory city,
        string memory transitCondition,
        string memory dignityScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(DignityEntry(city, transitCondition, dignityScore, emotionalTag));
        emit CommuterDignityTagged(city, transitCondition, dignityScore, emotionalTag);
    }
}
