// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CleanMigrantFastTrackProtocol {
    address public admin;

    struct MigrantEntry {
        string migrantName;
        string countryOrigin;
        string emotionalTag;
        bool summoned;
        bool fastTracked;
    }

    MigrantEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMigrant(string memory migrantName, string memory countryOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(MigrantEntry(migrantName, countryOrigin, emotionalTag, true, false));
    }

    function fastTrackMigrant(uint256 index) external onlyAdmin {
        entries[index].fastTracked = true;
    }

    function getMigrantEntry(uint256 index) external view returns (MigrantEntry memory) {
        return entries[index];
    }
}
