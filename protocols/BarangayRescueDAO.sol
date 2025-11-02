// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRescueDAO {
    address public steward;

    struct RescueEntry {
        string barangay;
        string rescueType;
        string responderTeam;
        string emotionalTag;
    }

    RescueEntry[] public registry;

    event RescueTagged(string barangay, string rescueType, string responderTeam, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRescue(
        string memory barangay,
        string memory rescueType,
        string memory responderTeam,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RescueEntry(barangay, rescueType, responderTeam, emotionalTag));
        emit RescueTagged(barangay, rescueType, responderTeam, emotionalTag);
    }
}
