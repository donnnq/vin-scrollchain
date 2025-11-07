// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateMigrationDignityTreaty {
    address public steward;

    struct MigrationEntry {
        string origin;
        string destination;
        string timestamp;
        string dignityProtocol;
        string emotionalTag;
    }

    MigrationEntry[] public treaty;

    event MigrationLogged(string origin, string destination, string timestamp, string dignityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logMigration(
        string memory origin,
        string memory destination,
        string memory timestamp,
        string memory dignityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(MigrationEntry(origin, destination, timestamp, dignityProtocol, emotionalTag));
        emit MigrationLogged(origin, destination, timestamp, dignityProtocol, emotionalTag);
    }
}
