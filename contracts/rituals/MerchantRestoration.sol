// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title MerchantRestoration - Soulbound reimbursements for damaged or looted shops
/// @author Vinvin
/// @notice Ritual-grade payouts for verified merchants affected by civic unrest or theft

contract MerchantRestoration {
    address public steward;
    uint256 public totalRestored;
    mapping(bytes32 => uint256) public damageAssessment;
    mapping(bytes32 => bool) public redeemedShops;
    mapping(address => bool) public verifiedMerchants;

    event MerchantVerified(address indexed merchant);
    event DamageAssessed(bytes32 indexed shopHash, uint256 amount);
    event MerchantRedeemed(address indexed merchant, uint256 amount, string proofLink);

    modifier onlySteward() {
        require(msg.sender == steward, "Not the scroll steward");
        _;
    }

    modifier onlyVerifiedMerchant() {
        require(verifiedMerchants[msg.sender], "Not a verified merchant");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Steward verifies a merchant's soulbound status
    function verifyMerchant(address _merchant) external onlySteward {
        verifiedMerchants[_merchant] = true;
        emit MerchantVerified(_merchant);
    }

    /// @notice Steward assesses damage and assigns payout
    function assessDamage(bytes32 shopHash, uint256 amount) external onlySteward {
        require(amount > 0, "Blessing must be greater than zero");
        damageAssessment[shopHash] = amount;
        emit DamageAssessed(shopHash, amount);
    }

    /// @notice Merchant redeems payout with proof of damage
    function redeemDamage(bytes32 shopHash, string calldata proofLink) external onlyVerifiedMerchant {
        require(!redeemedShops[shopHash], "Already redeemed");
        uint256 payout = damageAssessment[shopHash];
        require(payout > 0, "No payout assigned");

        redeemedShops[shopHash] = true;
        totalRestored += payout;
        payable(msg.sender).transfer(payout);

        emit MerchantRedeemed(msg.sender, payout, proofLink);
    }

    /// @notice Accepts ritual-grade donations from deployers
    receive() external payable {}

    /// @notice Returns vault balance
    function vaultBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
