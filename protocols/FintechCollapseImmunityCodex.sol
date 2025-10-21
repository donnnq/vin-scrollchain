// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FintechCollapseImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string companyName;
        string collapseSignal;
        string immunityClause;
        string emotionalTag;
        bool summoned;
        bool fortified;
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

    function summonImmunity(string memory companyName, string memory collapseSignal, string memory immunityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(companyName, collapseSignal, immunityClause, emotionalTag, true, false, false));
    }

    function confirmFortification(uint256 index) external onlyAdmin {
        entries[index].fortified = true;
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].fortified, "Must be fortified first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
