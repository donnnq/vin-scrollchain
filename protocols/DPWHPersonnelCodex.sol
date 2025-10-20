// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHPersonnelCodex {
    address public admin;

    struct PersonnelEntry {
        string name;
        string role;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    PersonnelEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPersonnel(string memory name, string memory role, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(PersonnelEntry(name, role, auditClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealPersonnelEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getPersonnelEntry(uint256 index) external view returns (PersonnelEntry memory) {
        return entries[index];
    }
}
