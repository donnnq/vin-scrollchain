// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConflictDeescalationDAO {
    address public admin;

    struct DeescalationEntry {
        string region;
        string conflictType;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    DeescalationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDeescalation(string memory region, string memory conflictType, string memory emotionalTag) external onlyAdmin {
        entries.push(DeescalationEntry(region, conflictType, emotionalTag, true, false));
    }

    function resolveDeescalation(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getDeescalation(uint256 index) external view returns (DeescalationEntry memory) {
        return entries[index];
    }
}
