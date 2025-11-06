// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayOversightLedger {
    address public steward;

    struct OversightEntry {
        string barangay;
        string projectName;
        string monitoringStatus;
        string emotionalTag;
    }

    OversightEntry[] public ledger;

    event OversightTagged(string barangay, string projectName, string monitoringStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOversight(
        string memory barangay,
        string memory projectName,
        string memory monitoringStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(OversightEntry(barangay, projectName, monitoringStatus, emotionalTag));
        emit OversightTagged(barangay, projectName, monitoringStatus, emotionalTag);
    }
}
