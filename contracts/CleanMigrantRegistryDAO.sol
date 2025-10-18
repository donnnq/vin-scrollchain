// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanMigrantRegistryDAO {
    address public admin;

    struct MigrantEntry {
        string name;
        string countryOrigin;
        string emotionalTag;
        bool summoned;
        bool verified;
    }

    MigrantEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMigrant(string memory name, string memory countryOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(MigrantEntry(name, countryOrigin, emotionalTag, true, false));
    }

    function verifyMigrant(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getMigrantEntry(uint256 index) external view returns (MigrantEntry memory) {
        return entries[index];
    }
}
