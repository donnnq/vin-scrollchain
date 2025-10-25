// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DefenseToMineralAuditGrid {
    address public steward;

    struct AuditEntry {
        string mineralType; // "Neodymium", "Yttrium", "Terbium"
        string defenseUseCase; // "F-35", "Missile guidance", "Radar systems"
        string originCountry; // "China", "Vietnam", "Australia"
        string auditStatus; // "Compromised", "Secure", "Pending"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditMineral(string memory mineralType, string memory defenseUseCase, string memory originCountry, string memory auditStatus, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(mineralType, defenseUseCase, originCountry, auditStatus, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
