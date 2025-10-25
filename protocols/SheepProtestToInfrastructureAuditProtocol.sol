// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SheepProtestToInfrastructureAuditProtocol {
    address public steward;

    struct ProtestAudit {
        string location; // "Mingdu Street Office, Xi’an"
        string date; // "October 19, 2025"
        string symbolicSignal; // "Collective petition", "Gate blockade"
        string infrastructureNeglect; // "Unhardened water dams", "Ignored rural needs"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    ProtestAudit[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditProtest(string memory location, string memory date, string memory symbolicSignal, string memory infrastructureNeglect, string memory emotionalTag) external onlySteward {
        entries.push(ProtestAudit(location, date, symbolicSignal, infrastructureNeglect, emotionalTag, true, false));
    }

    function sealAuditEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (ProtestAudit memory) {
        return entries[index];
    }
}
