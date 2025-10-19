// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryAusterityAuditProtocol {
    address public admin;

    struct AuditEntry {
        string countryName;
        string austerityMeasure;
        string impactSummary;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory countryName, string memory austerityMeasure, string memory impactSummary, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(countryName, austerityMeasure, impactSummary, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
