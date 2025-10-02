// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Real Estate Risk Protocol v1.0
/// @notice Emotionally tagged smart contract for monitoring property sector exposure and systemic risk

contract RealEstateRiskProtocol {
    struct PropertySector {
        uint256 vacancyRate; // in percentage
        uint256 bankExposure; // in millions
        bool isCorridorSensitive;
        bool flaggedForOversupply;
    }

    mapping(uint256 => PropertySector) public sectors;
    uint256 public nextSectorId;

    /// @notice Add a new property sector for monitoring
    function addSector(
        uint256 vacancy,
        uint256 exposure,
        bool corridorSensitive,
        bool oversupply
    ) external {
        sectors[nextSectorId] = PropertySector({
            vacancyRate: vacancy,
            bankExposure: exposure,
            isCorridorSensitive: corridorSensitive,
            flaggedForOversupply: oversupply
        });
        nextSectorId++;
    }

    /// @notice Check if a sector is high-risk
    function isHighRisk(uint256 sectorId) external view returns (bool) {
        PropertySector memory s = sectors[sectorId];
        return s.vacancyRate > 20 || s.bankExposure > 500 || s.flaggedForOversupply;
    }

    /// @notice Get total bank exposure across all sectors
    function totalBankExposure() external view returns (uint256 total) {
        for (uint256 i = 0; i < nextSectorId; i++) {
            total += sectors[i].bankExposure;
        }
    }

    /// @notice Count corridor-sensitive sectors
    function countCorridorSensitive() external view returns (uint256 count) {
        for (uint256 i = 0; i < nextSectorId; i++) {
            if (sectors[i].isCorridorSensitive) {
                count++;
            }
        }
    }
}
