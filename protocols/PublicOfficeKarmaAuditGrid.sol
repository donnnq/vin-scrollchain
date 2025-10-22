// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicOfficeKarmaAuditGrid {
    address public admin;

    struct KarmaEntry {
        string officialName;
        string officeHeld;
        string exitTrigger; // "Controversy", "Reassignment", "Voluntary Retirement"
        string karmicSignal; // "Life goes on", "I forgive", "I will explore"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function auditKarma(string memory officialName, string memory officeHeld, string memory exitTrigger, string memory karmicSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(officialName, officeHeld, exitTrigger, karmicSignal, emotionalTag, true, false));
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
