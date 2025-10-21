// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InformalShelterAuditRegistry {
    address public admin;

    struct ShelterEntry {
        string location;
        string shelterType; // "Tent", "Shanty", "Makeshift"
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    ShelterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonShelterAudit(string memory location, string memory shelterType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ShelterEntry(location, shelterType, auditClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealShelterEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getShelterEntry(uint256 index) external view returns (ShelterEntry memory) {
        return entries[index];
    }
}
