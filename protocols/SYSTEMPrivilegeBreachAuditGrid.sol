// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SYSTEMPrivilegeBreachAuditGrid {
    address public admin;

    struct BreachEntry {
        string attackVector; // "Malicious SMB server"
        string privilegeLevel; // "SYSTEM"
        string breachSignal; // "Full device control", "Lateral movement", "Data exfiltration"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    BreachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function auditBreach(string memory attackVector, string memory privilegeLevel, string memory breachSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BreachEntry(attackVector, privilegeLevel, breachSignal, emotionalTag, true, false));
    }

    function sealBreachEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getBreachEntry(uint256 index) external view returns (BreachEntry memory) {
        return entries[index];
    }
}
