// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicMigrationSentimentLedger {
    address public steward;

    struct MigrationEntry {
        string originState;
        string destinationState;
        string migrationReason;
        string emotionalTag;
    }

    MigrationEntry[] public ledger;

    event CivicMigrationTagged(string originState, string destinationState, string migrationReason, string emotionalTag);

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
        emit CivicMigrationTagged(originState, destinationState, migrationReason, emotionalTag);
    }
}
