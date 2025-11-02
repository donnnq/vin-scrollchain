// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalBarangayTalentGrid {
    address public steward;

    struct TalentEntry {
        string barangay;
        string skillSet;
        string availabilityStatus;
        string emotionalTag;
    }

    TalentEntry[] public grid;

    event TalentBroadcasted(string barangay, string skillSet, string availabilityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastTalent(
        string memory barangay,
        string memory skillSet,
        string memory availabilityStatus,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(TalentEntry(barangay, skillSet, availabilityStatus, emotionalTag));
        emit TalentBroadcasted(barangay, skillSet, availabilityStatus, emotionalTag);
    }
}
