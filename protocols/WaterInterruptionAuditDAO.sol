// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterInterruptionAuditDAO {
    address public admin;

    struct InterruptionEntry {
        string barangay;
        string provider; // "PrimeWater", "Bulacan Bulk", "Malolos Water District"
        string causeTag; // "Maintenance", "Well Delay", "Pressure Drop"
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    InterruptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory barangay, string memory provider, string memory causeTag, string memory emotionalTag) external onlyAdmin {
        entries.push(InterruptionEntry(barangay, provider, causeTag, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealInterruptionEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getInterruptionEntry(uint256 index) external view returns (InterruptionEntry memory) {
        return entries[index];
    }
}
