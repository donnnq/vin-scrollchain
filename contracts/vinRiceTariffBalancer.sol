// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRiceTariffBalancer {
    address public DA; // Department of Agriculture oracle
    address public COOP_REGISTRY; // Verified Farmer Cooperatives
    uint256 public baseTariff = 35; // Default import tariff (%)

    event TariffAdjusted(uint256 newTariff, string reason, uint256 timestamp);

    modifier onlyDA() {
        require(msg.sender == DA, "Unauthorized: DA access only");
        _;
    }

    constructor(address _DA, address _COOP_REGISTRY) {
        DA = _DA;
        COOP_REGISTRY = _COOP_REGISTRY;
    }

    function adjustTariff(
        uint256 harvestSurplus,
        uint256 importPressure,
        bool isCoopVerified
    ) external onlyDA returns (uint256) {
        uint256 newTariff = baseTariff;

        // 🌀 Ritual Logic: Lower tariff for verified cooperatives during surplus seasons
        if (isCoopVerified && harvestSurplus > importPressure) {
            newTariff = 0;
        } else if (harvestSurplus > importPressure) {
            newTariff = 15;
        } else if (importPressure > harvestSurplus) {
            newTariff = 40;
        }

        emit TariffAdjusted(newTariff, isCoopVerified ? "Coop relief" : "Economic recalibration", block.timestamp);
        return newTariff;
    }

    function updateDA(address _newDA) external onlyDA {
        DA = _newDA;
    }

    function updateBaseTariff(uint256 _tariff) external onlyDA {
        require(_tariff <= 100, "Tariff too high");
        baseTariff = _tariff;
    }
}
