// SPDX-License-Identifier: VINVINverseAudit
pragma solidity ^0.8.0;

contract EnergyAuditChain {
    address public scrollmaster;

    struct AuditEntry {
        string minerName;
        string country;
        uint256 totalEnergyUsed;
        uint256 renewablesUsed;
        bool compliant;
        string rewardOrFineTag;
        uint256 timestamp;
    }

    AuditEntry[] public auditLog;

    event AuditPinged(string minerName, string country, bool compliant, string tag, uint256 timestamp);

    constructor() {
        scrollmaster = msg.sender;
    }

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN can launch audit blasts.");
        _;
    }

    function logAudit(
        string memory minerName,
        string memory country,
        uint256 totalEnergyUsed,
        uint256 renewablesUsed,
        bool compliant,
        string memory rewardOrFineTag
    ) public onlyMaster {
        auditLog.push(AuditEntry(minerName, country, totalEnergyUsed, renewablesUsed, compliant, rewardOrFineTag, block.timestamp));
        emit AuditPinged(minerName, country, compliant, rewardOrFineTag, block.timestamp);
    }

    function getAudit(uint index) public view returns (string memory, string memory, uint256, uint256, bool, string memory, uint256) {
        AuditEntry memory a = auditLog[index];
        return (a.minerName, a.country, a.totalEnergyUsed, a.renewablesUsed, a.compliant, a.rewardOrFineTag, a.timestamp);
    }

    function totalAudits() public view returns (uint) {
        return auditLog.length;
    }
}
