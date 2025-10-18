// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionPurgeAuditDAO {
    address public admin;

    struct PurgeEntry {
        string officialName;
        string rank;
        string emotionalTag;
        bool summoned;
        bool purged;
    }

    PurgeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPurge(string memory officialName, string memory rank, string memory emotionalTag) external onlyAdmin {
        entries.push(PurgeEntry(officialName, rank, emotionalTag, true, false));
    }

    function purgeOfficial(uint256 index) external onlyAdmin {
        entries[index].purged = true;
    }

    function getPurgeEntry(uint256 index) external view returns (PurgeEntry memory) {
        return entries[index];
    }
}
