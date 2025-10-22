// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalAuditImmunityGrid {
    address public admin;

    struct ImmunityEntry {
        string entityName; // "Open Society Foundations"
        string politicalTarget; // "Trump Treasury"
        string auditType; // "IRS review", "Tax-exempt challenge"
        string emotionalTag;
        bool immune;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function declareImmunity(string memory entityName, string memory politicalTarget, string memory auditType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(entityName, politicalTarget, auditType, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
