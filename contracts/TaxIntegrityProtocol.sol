// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Tax Integrity Protocol v1.0
/// @notice Emotionally tagged smart contract for durable tax reform and corridor protection

contract TaxIntegrityProtocol {
    struct Taxpayer {
        bool isHighRisk;
        bool consumesSugaryGoods;
        bool receivesIncentives;
        uint256 vatComplianceScore;
    }

    mapping(address => Taxpayer) public taxpayers;

    /// @notice Register a taxpayer with basic traits
    function registerTaxpayer(
        bool highRisk,
        bool sugaryConsumer,
        bool receivesIncentive,
        uint256 vatScore
    ) external {
        taxpayers[msg.sender] = Taxpayer({
            isHighRisk: highRisk,
            consumesSugaryGoods: sugaryConsumer,
            receivesIncentives: receivesIncentive,
            vatComplianceScore: vatScore
        });
    }

    /// @notice Calculate excise tax based on consumption
    function calculateExciseTax(address taxpayerAddr) external view returns (uint256) {
        Taxpayer memory t = taxpayers[taxpayerAddr];
        uint256 baseTax = 0;
        if (t.consumesSugaryGoods) baseTax += 15; // 15% excise
        return baseTax;
    }

    /// @notice Evaluate VAT compliance
    function isVATCompliant(address taxpayerAddr) external view returns (bool) {
        return taxpayers[taxpayerAddr].vatComplianceScore >= 80;
    }

    /// @notice Flag risky taxpayers for audit
    function needsAudit(address taxpayerAddr) external view returns (bool) {
        Taxpayer memory t = taxpayers[taxpayerAddr];
        return t.isHighRisk || t.vatComplianceScore < 50;
    }

    /// @notice Monitor incentive exposure
    function isIncentiveOverused(address taxpayerAddr) external view returns (bool) {
        return taxpayers[taxpayerAddr].receivesIncentives;
    }
}
