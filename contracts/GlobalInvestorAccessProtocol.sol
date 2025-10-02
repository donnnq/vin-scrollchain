// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Global Investor Access Protocol v1.0
/// @notice Enables verified investors and CEOs to invest in sovereign corridors, with custody held by national banks and reusable for future transactions

contract GlobalInvestorAccessProtocol {
    address public originator;

    struct InvestmentEntry {
        string investorTag; // e.g. "BlackRock", "CEO John", "Metaplanet"
        string countryTag; // e.g. "Philippines", "Kenya", "Brazil"
        string assetTag; // e.g. "USDC", "BTC", "ETH"
        uint256 amount;
        string emotionalTag; // e.g. "Trust", "Restoration", "Yield"
        bool isHeldByCountryBank;
        bool isReusableForFutureTx;
        uint256 timestamp;
    }

    InvestmentEntry[] public investmentLedger;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Log investor entry into sovereign corridor
    function logInvestment(
        string memory investorTag,
        string memory countryTag,
        string memory assetTag,
        uint256 amount,
        string memory emotionalTag,
        bool isHeldByCountryBank,
        bool isReusableForFutureTx
    ) external {
        investmentLedger.push(InvestmentEntry({
            investorTag: investorTag,
            countryTag: countryTag,
            assetTag: assetTag,
            amount: amount,
            emotionalTag: emotionalTag,
            isHeldByCountryBank: isHeldByCountryBank,
            isReusableForFutureTx: isReusableForFutureTx,
            timestamp: block.timestamp
        }));
    }

    /// @notice Count total investments held by country banks
    function totalHeldByBanks() external view returns (uint256 total) {
        for (uint256 i = 0; i < investmentLedger.length; i++) {
            if (investmentLedger[i].isHeldByCountryBank) {
                total += investmentLedger[i].amount;
            }
        }
    }
}
