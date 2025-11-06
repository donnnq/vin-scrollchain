// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BusinessMigrationLedger {
    address public steward;

    struct MigrationEntry {
        string businessName;
        string originState;
        string destinationState;
        string migrationReason;
        string emotionalTag;
    }

    MigrationEntry[] public ledger;

    event BusinessMigrationTagged(string businessName, string originState, string destinationState, string migrationReason, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMigration(
        string memory businessName,
        string memory originState,
        string memory destinationState,
        string memory migrationReason,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(MigrationEntry(businessName, originState, destinationState, migrationReason, emotionalTag));
        emit BusinessMigrationTagged(businessName, originState, destinationState, migrationReason, emotionalTag);
    }
}
