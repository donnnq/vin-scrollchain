// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrationEquityLedger {
    address public steward;

    struct MigrationEntry {
        string originState;
        string destinationState;
        string migrationReason;
        string emotionalTag;
    }

    MigrationEntry[] public ledger;

    event MigrationEquityTagged(string originState, string destinationState, string migrationReason, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMigration(
        string memory originState,
        string memory destinationState,
        string memory migrationReason,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(MigrationEntry(originState, destinationState, migrationReason, emotionalTag));
        emit MigrationEquityTagged(originState, destinationState, migrationReason, emotionalTag);
    }
}
