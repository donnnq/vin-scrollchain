// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContributorImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string contributorName;
        string project;
        string immunityClause;
        string emotionalTag;
        bool summoned;
        bool granted;
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

    function summonImmunity(string memory contributorName, string memory project, string memory immunityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(contributorName, project, immunityClause, emotionalTag, true, false, false));
    }

    function confirmGrant(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
