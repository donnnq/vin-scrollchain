// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIReadyBarangayIndex {
    address public steward;

    struct ReadinessEntry {
        string barangay;
        string readinessSignal;
        string infrastructureLevel;
        string emotionalTag;
    }

    ReadinessEntry[] public index;

    event AIReadinessIndexed(string barangay, string readinessSignal, string infrastructureLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexReadiness(
        string memory barangay,
        string memory readinessSignal,
        string memory infrastructureLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ReadinessEntry(barangay, readinessSignal, infrastructureLevel, emotionalTag));
        emit AIReadinessIndexed(barangay, readinessSignal, infrastructureLevel, emotionalTag);
    }
}
