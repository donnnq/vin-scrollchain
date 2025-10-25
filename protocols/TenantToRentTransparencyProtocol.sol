// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TenantToRentTransparencyProtocol {
    address public steward;

    struct RentEntry {
        string tenantID; // "Worker-Cavite-001"
        string unitType; // "Studio pod", "Shared dorm"
        string rentAmount; // "₱2,500/month"
        string auditMethod; // "Scrollchain ledger", "Barangay oversight", "Tenant feedback loop"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    RentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logRent(string memory tenantID, string memory unitType, string memory rentAmount, string memory auditMethod, string memory emotionalTag) external onlySteward {
        entries.push(RentEntry(tenantID, unitType, rentAmount, auditMethod, emotionalTag, true, false));
    }

    function sealRentEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getRentEntry(uint256 index) external view returns (RentEntry memory) {
        return entries[index];
    }
}
