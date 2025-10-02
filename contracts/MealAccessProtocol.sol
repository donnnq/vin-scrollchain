// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Meal Access Protocol v1.0
/// @notice Emotionally tagged smart contract for affordable, portion-scaled, and badge-access meals

contract MealAccessProtocol {
    address public originator;

    struct MealOffer {
        string restaurant;
        string mealName;
        uint256 price;
        bool isScaledPortion;
        bool isBadgeEligible;
        string emotionalTag; // e.g. "Empowerment", "Protection", "Restoration"
    }

    MealOffer[] public offers;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Register a new meal offer
    function registerMealOffer(
        string memory restaurant,
        string memory mealName,
        uint256 price,
        bool scaledPortion,
        bool badgeEligible,
        string memory emotionalTag
    ) external {
        offers.push(MealOffer({
            restaurant: restaurant,
            mealName: mealName,
            price: price,
            isScaledPortion: scaledPortion,
            isBadgeEligible: badgeEligible,
            emotionalTag: emotionalTag
        }));
    }

    /// @notice Count total badge-eligible meals
    function countBadgeMeals() external view returns (uint256 count) {
        for (uint256 i = 0; i < offers.length; i++) {
            if (offers[i].isBadgeEligible) {
                count++;
            }
        }
    }

    /// @notice Get average price of scaled meals
    function averageScaledMealPrice() external view returns (uint256 avg) {
        uint256 total;
        uint256 count;
        for (uint256 i = 0; i < offers.length; i++) {
            if (offers[i].isScaledPortion) {
                total += offers[i].price;
                count++;
            }
        }
        avg = count > 0 ? total / count : 0;
    }

    /// @notice Emotional tags for meal access rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🌱 Empowerment, 🔥 Deterrence, 😆 Humor, 🧭 Restoration";
    }
}
