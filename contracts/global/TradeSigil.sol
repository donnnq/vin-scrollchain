// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TradeSigil - Ritual scroll for global trade alliances and unified tariffs
/// @author Vinvin
/// @notice Sets flat 2% tariff across all registered import-export partnerships

contract TradeSigil {
    address public scrollsmith;

    struct TradeAlliance {
        string countryA;
        string countryB;
        string commodity;
        uint256 tariffRate;
        bool isActive;
    }

    TradeAlliance[] public alliances;

    event AllianceRegistered(string countryA, string countryB, string commodity, uint256 tariffRate);
    event TariffUpdated(string countryA, string countryB, string commodity, uint256 newRate);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a new trade alliance with default 2% tariff
    function registerAlliance(string calldata countryA, string calldata countryB, string calldata commodity) external onlyScrollsmith {
        alliances.push(TradeAlliance(countryA, countryB, commodity, 2, true));
        emit AllianceRegistered(countryA, countryB, commodity, 2);
    }

    /// @notice Update tariff rate (if needed)
    function updateTariff(uint256 allianceId, uint256 newRate) external onlyScrollsmith {
        require(allianceId < alliances.length, "Invalid ID");
        alliances[allianceId].tariffRate = newRate;
        emit TariffUpdated(alliances[allianceId].countryA, alliances[allianceId].countryB, alliances[allianceId].commodity, newRate);
    }

    /// @notice View all alliances
    function getAllAlliances() external view returns (TradeAlliance[] memory) {
        return alliances;
    }
}
