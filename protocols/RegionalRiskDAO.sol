// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegionalRiskDAO {
    address public admin;

    struct RiskEntry {
        string region;
        string hazardType;
        string vulnerabilityLevel;
        string emotionalTag;
        bool summoned;
        bool assessed;
        bool sealed;
    }

    RiskEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRisk(string memory region, string memory hazardType, string memory vulnerabilityLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(RiskEntry(region, hazardType, vulnerabilityLevel, emotionalTag, true, false, false));
    }

    function confirmAssessment(uint256 index) external onlyAdmin {
        entries[index].assessed = true;
    }

    function sealRiskEntry(uint256 index) external onlyAdmin {
        require(entries[index].assessed, "Must be assessed first");
        entries[index].sealed = true;
    }

    function getRiskEntry(uint256 index) external view returns (RiskEntry memory) {
        return entries[index];
    }
}
