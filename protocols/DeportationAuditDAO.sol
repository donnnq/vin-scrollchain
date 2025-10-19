// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeportationAuditDAO {
    address public admin;

    struct DeportationEntry {
        string migrantName;
        string hostCountry;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    DeportationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDeportation(string memory migrantName, string memory hostCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(DeportationEntry(migrantName, hostCountry, emotionalTag, true, false, false));
    }

    function auditDeportation(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getDeportationEntry(uint256 index) external view returns (DeportationEntry memory) {
        return entries[index];
    }
}
