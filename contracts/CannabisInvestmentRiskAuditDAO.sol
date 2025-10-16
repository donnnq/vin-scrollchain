// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisInvestmentRiskAuditDAO {
    address public admin;

    struct RiskEntry {
        string companyLabel;
        string riskType;
        string emotionalTag;
        bool audited;
    }

    RiskEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory companyLabel, string memory riskType, string memory emotionalTag) external onlyAdmin {
        entries.push(RiskEntry(companyLabel, riskType, emotionalTag, false));
    }

    function markAudited(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getEntry(uint256 index) external view returns (RiskEntry memory) {
        return entries[index];
    }
}
