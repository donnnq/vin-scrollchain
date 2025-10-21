// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FatFingerRiskRegistry {
    address public admin;

    struct RiskEntry {
        string asset;
        string riskType; // "Minting", "Burning", "Transfer"
        string triggerClause; // "Decimal Misplacement", "Zero Overflow", "Manual Input"
        string emotionalTag;
        bool summoned;
        bool logged;
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

    function summonRisk(string memory asset, string memory riskType, string memory triggerClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RiskEntry(asset, riskType, triggerClause, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealRiskEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getRiskEntry(uint256 index) external view returns (RiskEntry memory) {
        return entries[index];
    }
}
