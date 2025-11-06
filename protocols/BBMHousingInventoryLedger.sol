// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BBMHousingInventoryLedger {
    address public steward;

    struct HousingEntry {
        string projectName;
        string location;
        string unitStatus; // e.g., "Available", "Occupied", "For Improvement"
        string emotionalTag;
    }

    HousingEntry[] public inventory;

    event HousingUnitTagged(string projectName, string location, string unitStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagUnit(
        string memory projectName,
        string memory location,
        string memory unitStatus,
        string memory emotionalTag
    ) public onlySteward {
        inventory.push(HousingEntry(projectName, location, unitStatus, emotionalTag));
        emit HousingUnitTagged(projectName, location, unitStatus, emotionalTag);
    }
}
