// SPDX-License-Identifier: Mythic-Restore
pragma solidity ^0.8.19;

contract MigrationSanctum {
    struct Migrant {
        address wallet;
        string originCountry;
        string destinationCountry;
        bool verified;
        bool grantedSanctum;
    }

    mapping(address => Migrant) public migrants;

    event SanctumGranted(address indexed wallet, string destination);

    function registerMigrant(address wallet, string memory origin, string memory destination) public {
        migrants[wallet] = Migrant(wallet, origin, destination, true, false);
    }

    function grantSanctum(address wallet) public {
        require(migrants[wallet].verified, "Migrant not verified");
        migrants[wallet].grantedSanctum = true;
        emit SanctumGranted(wallet, migrants[wallet].destinationCountry);
    }

    function isSanctumGranted(address wallet) public view returns (bool) {
        return migrants[wallet].grantedSanctum;
    }
}
