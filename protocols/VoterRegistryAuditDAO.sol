// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterRegistryAuditDAO {
    address public admin;

    struct RegistryEntry {
        string precinctID;
        string anomalyType;
        string auditStatus;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    RegistryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRegistryAudit(string memory precinctID, string memory anomalyType, string memory auditStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(RegistryEntry(precinctID, anomalyType, auditStatus, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealRegistryAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getRegistryEntry(uint256 index) external view returns (RegistryEntry memory) {
        return entries[index];
    }
}
