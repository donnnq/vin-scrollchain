// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIReadinessIndexPH {
    address public steward;

    struct ReadinessEntry {
        string barangay;
        string sector;
        string readinessScore;
        string emotionalTag;
    }

    ReadinessEntry[] public index;

    event AIReadinessTagged(string barangay, string sector, string readinessScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReadiness(
        string memory barangay,
        string memory sector,
        string memory readinessScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ReadinessEntry(barangay, sector, readinessScore, emotionalTag));
        emit AIReadinessTagged(barangay, sector, readinessScore, emotionalTag);
    }
}
