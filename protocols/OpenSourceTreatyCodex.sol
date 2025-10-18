// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OpenSourceTreatyCodex {
    address public admin;

    struct TreatyEntry {
        string clauseTitle;
        string steward;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool archived;
    }

    TreatyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonClause(string memory clauseTitle, string memory steward, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(clauseTitle, steward, emotionalTag, true, false, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function archiveClause(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
