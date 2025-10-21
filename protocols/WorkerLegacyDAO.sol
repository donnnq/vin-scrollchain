// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerLegacyDAO {
    address public admin;

    struct LegacyEntry {
        string workerName;
        string sector;
        string legacyClause;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool sealed;
    }

    LegacyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLegacy(string memory workerName, string memory sector, string memory legacyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LegacyEntry(workerName, sector, legacyClause, emotionalTag, true, false, false));
    }

    function confirmArchival(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function sealLegacyEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getLegacyEntry(uint256 index) external view returns (LegacyEntry memory) {
        return entries[index];
    }
}
