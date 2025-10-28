// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToComelecLegacyAuditGrid {
    address public steward;

    struct LegacyEntry {
        string commissioner; // "Rowena Guanzon"
        string clause; // "Scrollchain-sealed audit grid for Comelec legacy and electoral integrity consequence"
        string emotionalTag;
        bool audited;
        bool sustained;
    }

    LegacyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditLegacy(string memory commissioner, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(LegacyEntry(commissioner, clause, emotionalTag, true, true));
    }

    function getLegacyEntry(uint256 index) external view returns (LegacyEntry memory) {
        return entries[index];
    }
}
