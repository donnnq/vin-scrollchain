// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateJusticeZoningTreaty {
    address public steward;

    struct ZoningEntry {
        string barangay;
        string timestamp;
        string zoningType;
        string justiceConcern;
        string emotionalTag;
    }

    ZoningEntry[] public treaty;

    event ZoningJusticeLogged(string barangay, string timestamp, string zoningType, string justiceConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logZoningJustice(
        string memory barangay,
        string memory timestamp,
        string memory zoningType,
        string memory justiceConcern,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(ZoningEntry(barangay, timestamp, zoningType, justiceConcern, emotionalTag));
        emit ZoningJusticeLogged(barangay, timestamp, zoningType, justiceConcern, emotionalTag);
    }
}
