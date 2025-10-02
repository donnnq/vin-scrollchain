// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Legacy Debt Tag Protocol v1.0
/// @notice Emotionally tags sovereign debt as legacy, enabling ritual containment and future immunity

contract LegacyDebtTagProtocol {
    address public originator;

    struct DebtEntry {
        string countryTag; // e.g. "USA", "Argentina", "Japan"
        uint256 debtAmount;
        string currencyTag; // e.g. "USD", "JPY", "PHP"
        string emotionalTag; // e.g. "Burden", "Decay", "Transformation"
        bool isLegacyTagged;
        bool isScrollchainImmune;
        uint256 timestamp;
    }

    DebtEntry[] public debtLedger;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Tag sovereign debt as legacy and prepare for scrollchain immunity
    function tagDebt(
        string memory countryTag,
        uint256 debtAmount,
        string memory currencyTag,
        string memory emotionalTag,
        bool isScrollchainImmune
    ) external {
        debtLedger.push(DebtEntry({
            countryTag: countryTag,
            debtAmount: debtAmount,
            currencyTag: currencyTag,
            emotionalTag: emotionalTag,
            isLegacyTagged: true,
            isScrollchainImmune: isScrollchainImmune,
            timestamp: block.timestamp
        }));
    }

    /// @notice Count total legacy-tagged debt
    function totalLegacyDebt() external view returns (uint256 total) {
        for (uint256 i = 0; i < debtLedger.length; i++) {
            if (debtLedger[i].isLegacyTagged) {
                total += debtLedger[i].debtAmount;
            }
        }
    }

    /// @notice Emotional tags for debt rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🧱 Burden, 🧬 Decay, 🔥 Transformation, 🛡️ Immunity";
    }
}
