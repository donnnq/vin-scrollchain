// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinBlackMarketBuyerIndex.sol
/// @author VINVIN
/// @notice Tracks repeat buyers of GPU systems from suspicious or unverifiable sources

contract vinBlackMarketBuyerIndex {
    address public scrollkeeper;

    struct BuyerProfile {
        uint256 totalPurchases;
        string alias;
        bool flagged;
    }

    mapping(address => BuyerProfile) public buyers;
    event BuyerLogged(address buyer, string alias, uint256 purchaseCount);
    event BuyerFlagged(address buyer, string reason);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Access denied");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Log new purchase by black market buyer
    function logPurchase(address buyer, string memory alias) external onlyScrollkeeper {
        buyers[buyer].totalPurchases += 1;
        buyers[buyer].alias = alias;
        emit BuyerLogged(buyer, alias, buyers[buyer].totalPurchases);

        if (buyers[buyer].totalPurchases >= 3) {
            buyers[buyer].flagged = true;
            emit BuyerFlagged(buyer, "Repeated GPU rack purchases detected");
        }
    }

    /// @notice View profile of suspicious buyer
    function getBuyerProfile(address buyer) external view returns (BuyerProfile memory) {
        return buyers[buyer];
    }

    /// @notice Check if a buyer is flagged
    function isFlagged(address buyer) external view returns (bool) {
        return buyers[buyer].flagged;
    }
}
