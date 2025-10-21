// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureRootCodex {
    address public admin;

    struct RootEntry {
        string zone;
        string rootType; // "Foundation Audit", "Structural Integrity", "Disaster Resilience"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool enforced;
        bool sealed;
    }

    RootEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRootCodex(string memory zone, string memory rootType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RootEntry(zone, rootType, codexClause, emotionalTag, true, false, false));
    }

    function confirmEnforcement(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function sealRootEntry(uint256 index) external onlyAdmin {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getRootEntry(uint256 index) external view returns (RootEntry memory) {
        return entries[index];
    }
}
