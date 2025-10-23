// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConflictFreeDOJAppointmentGrid {
    address public steward;

    struct AppointmentEntry {
        string appointeeName;
        string priorAffiliation;
        string vettingStatus; // "Cleared", "Flagged", "Pending"
        string emotionalTag;
        bool vetted;
        bool sealed;
    }

    AppointmentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function vetAppointee(string memory appointeeName, string memory priorAffiliation, string memory vettingStatus, string memory emotionalTag) external onlySteward {
        entries.push(AppointmentEntry(appointeeName, priorAffiliation, vettingStatus, emotionalTag, true, false));
    }

    function sealAppointmentEntry(uint256 index) external onlySteward {
        require(entries[index].vetted, "Must be vetted first");
        entries[index].sealed = true;
    }

    function getAppointmentEntry(uint256 index) external view returns (AppointmentEntry memory) {
        return entries[index];
    }
}
