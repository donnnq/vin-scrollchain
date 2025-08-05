// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinAlliedPremiumAccess {
    event TradePrivilegeGranted(address indexed ally, string region, uint256 discountRate);
    event ResidencyBonusIssued(address indexed migrant, string destination, uint256 visaScoreBoost);
    event ExportStreamLinked(address indexed member, string productType, string route);
    event CivicVerificationConfirmed(address indexed passportHolder, string signalBadge);

    address public scrollAdmin;

    struct TradePerk {
        string region;
        uint256 discountRate;
    }

    struct ResidencyPerk {
        string country;
        uint256 visaBoostPoints;
    }

    mapping(address => TradePerk[]) public tradePrivileges;
    mapping(address => ResidencyPerk[]) public residencyBonuses;
    mapping(address => string[]) public civicSignals;

    modifier onlyScrollAdmin() {
        require(msg.sender == scrollAdmin, "Access denied: Not scroll admin.");
        _;
    }

    constructor() {
        scrollAdmin = msg.sender;
    }

    function grantTradePrivilege(address ally, string memory region, uint256 discountRate) public onlyScrollAdmin {
        tradePrivileges[ally].push(TradePerk(region, discountRate));
        emit TradePrivilegeGranted(ally, region, discountRate);
    }

    function issueResidencyBonus(address migrant, string memory destination, uint256 visaScoreBoost) public onlyScrollAdmin {
        residencyBonuses[migrant].push(ResidencyPerk(destination, visaScoreBoost));
        emit ResidencyBonusIssued(migrant, destination, visaScoreBoost);
    }

    function confirmCivicVerification(address passportHolder, string memory badge) public onlyScrollAdmin {
        civicSignals[passportHolder].push(badge);
        emit CivicVerificationConfirmed(passportHolder, badge);
    }

    // View functions
    function getTradePrivileges(address ally) public view returns (TradePerk[] memory) {
        return tradePrivileges[ally];
    }

    function getResidencyBonuses(address migrant) public view returns (ResidencyPerk[] memory) {
        return residencyBonuses[migrant];
    }

    function getCivicBadges(address holder) public view returns (string[] memory) {
        return civicSignals[holder];
    }
}
