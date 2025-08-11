// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title VerifiedMigration - Ritual contract for clean-record migration and resettlement
contract VerifiedMigration {
    struct Migrant {
        string fullName;
        string originCountry;
        string destinationCountry;
        bool hasCleanRecord;
        bool isVerified;
        bool isApproved;
    }

    mapping(uint256 => Migrant) public migrants;
    uint256 public migrantCount;

    event MigrantRegistered(uint256 indexed id, string name);
    event MigrationApproved(uint256 indexed id);

    function registerMigrant(
        string memory fullName,
        string memory originCountry,
        string memory destinationCountry,
        bool hasCleanRecord,
        bool isVerified
    ) public {
        require(hasCleanRecord && isVerified, "Migrant must be verified and clean");
        migrants[migrantCount] = Migrant(fullName, originCountry, destinationCountry, hasCleanRecord, isVerified, false);
        emit MigrantRegistered(migrantCount, fullName);
        migrantCount++;
    }

    function approveMigration(uint256 id) public {
        require(migrants[id].hasCleanRecord, "Record not clean");
        require(migrants[id].isVerified, "Identity not verified");
        migrants[id].isApproved = true;
        emit MigrationApproved(id);
    }
}
