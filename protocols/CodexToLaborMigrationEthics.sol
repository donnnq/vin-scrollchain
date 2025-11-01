// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToLaborMigrationEthics {
    address public steward;

    struct MigrationEntry {
        string workerGroup;
        string originCorridor;
        string destinationCorridor;
        string protectionClause;
        string emotionalTag;
    }

    MigrationEntry[] public codex;

    event MigrationTagged(string workerGroup, string originCorridor, string destinationCorridor, string protectionClause, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagMigration(
        string memory workerGroup,
        string memory originCorridor,
        string memory destinationCorridor,
        string memory protectionClause,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(MigrationEntry(workerGroup, originCorridor, destinationCorridor, protectionClause, emotionalTag));
        emit MigrationTagged(workerGroup, originCorridor, destinationCorridor, protectionClause, emotionalTag);
    }
}
