// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHiringSanctumDAO {
    address public steward;

    struct HiringEvent {
        string location;
        string recruiterType;
        string schedule;
        string emotionalTag;
    }

    HiringEvent[] public registry;

    event HiringSanctumTagged(string location, string recruiterType, string schedule, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHiringSanctum(
        string memory location,
        string memory recruiterType,
        string memory schedule,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(HiringEvent(location, recruiterType, schedule, emotionalTag));
        emit HiringSanctumTagged(location, recruiterType, schedule, emotionalTag);
    }
}
