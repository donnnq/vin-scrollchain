// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureSabotageImmunityLedger {
    address public admin;

    struct ImmunityEntry {
        string agency; // "DPWH"
        string sabotageType; // "Arson", "Document destruction"
        string immunityAction; // "Cloud backup", "Offsite redundancy", "Whistleblower protection"
        string emotionalTag;
        bool immunized;
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

    function immunizeInfrastructure(string memory agency, string memory sabotageType, string memory immunityAction, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(agency, sabotageType, immunityAction, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immunized, "Must be immunized first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
