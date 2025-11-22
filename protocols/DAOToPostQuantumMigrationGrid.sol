// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToPostQuantumMigrationGrid {
    string public batchID = "1321.9.98";
    string public steward = "Vinvin";

    address public admin;

    struct Migration {
        address validator;
        string oldScheme;
        string newScheme;
        uint256 timestamp;
        bool completed;
    }

    mapping(address => Migration) public migrationRegistry;

    event MigrationInitiated(address indexed validator, string oldScheme, string newScheme);
    event MigrationCompleted(address indexed validator, string newScheme);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function initiateMigration(address validator, string memory oldScheme, string memory newScheme) public onlyAdmin {
        migrationRegistry[validator] = Migration(validator, oldScheme, newScheme, block.timestamp, false);
        emit MigrationInitiated(validator, oldScheme, newScheme);
    }

    function completeMigration(address validator) public onlyAdmin {
        Migration storage m = migrationRegistry[validator];
        m.completed = true;
        emit MigrationCompleted(validator, m.newScheme);
    }

    function isMigrated(address validator) public view returns (bool) {
        return migrationRegistry[validator].completed;
    }
}
