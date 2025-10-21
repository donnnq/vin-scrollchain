// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicBiasAuditProtocol {
    address public admin;

    struct BiasEntry {
        string institution;
        string biasType; // "Chairmanship", "Investigation Scope", "Media Framing"
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    BiasEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBiasAudit(string memory institution, string memory biasType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BiasEntry(institution, biasType, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealBiasEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getBiasEntry(uint256 index) external view returns (BiasEntry memory) {
        return entries[index];
    }
}
