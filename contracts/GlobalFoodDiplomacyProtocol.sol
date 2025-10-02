// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Global Food Diplomacy Protocol v1.0
/// @notice Ritualizes sovereign food aid, emotional tagging, and reputational immunity across planetary corridors

contract GlobalFoodDiplomacyProtocol {
    address public originator;

    struct FoodDiplomacyEntry {
        string donorCountry; // e.g. "USA", "Brazil", "Philippines"
        string recipientCountry; // e.g. "Kenya", "Bangladesh", "Haiti"
        string foodAssetTag; // e.g. "Rice", "Soybeans", "Corn", "Canned Goods"
        uint256 quantityInMetricTons;
        string emotionalTag; // e.g. "Mercy", "Restoration", "Dignity", "Solidarity"
        bool isEmergencyRelief;
        bool isCulturallyAligned;
        uint256 timestamp;
    }

    FoodDiplomacyEntry[] public diplomacyLedger;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Log sovereign food aid with emotional and cultural tagging
    function logFoodAid(
        string memory donorCountry,
        string memory recipientCountry,
        string memory foodAssetTag,
        uint256 quantityInMetricTons,
        string memory emotionalTag,
        bool isEmergencyRelief,
        bool isCulturallyAligned
    ) external {
        diplomacyLedger.push(FoodDiplomacyEntry({
            donorCountry: donorCountry,
            recipientCountry: recipientCountry,
            foodAssetTag: foodAssetTag,
            quantityInMetricTons: quantityInMetricTons,
            emotionalTag: emotionalTag,
            isEmergencyRelief: isEmergencyRelief,
            isCulturallyAligned: isCulturallyAligned,
            timestamp: block.timestamp
        }));
    }

    /// @notice Count total food aid delivered
    function totalFoodAidDelivered() external view returns (uint256 total) {
        for (uint256 i = 0; i < diplomacyLedger.length; i++) {
            total += diplomacyLedger[i].quantityInMetricTons;
        }
    }

    /// @notice Emotional tags for food diplomacy rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Mercy, 🌱 Restoration, 🍽️ Dignity, 🤝 Solidarity"
    }
}
