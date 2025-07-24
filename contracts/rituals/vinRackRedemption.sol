// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinRackRedemption.sol
/// @author VINVIN
/// @notice Enables flagged buyers to initiate a scrollkeeper-backed forgiveness protocol for repeated GPU rack purchases

contract vinRackRedemption {
    address public scrollkeeper;
    mapping(address => bool) public redemptionRequested;
    mapping(address => string) public repentanceMessage;
    mapping(address => bool) public redeemed;

    event RedemptionRequested(address buyer, string message);
    event RedemptionApproved(address buyer);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can forgive");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Buyer requests redemption with repentance message
    function requestRedemption(address buyer, string memory message) external onlyScrollkeeper {
        redemptionRequested[buyer] = true;
        repentanceMessage[buyer] = message;
        emit RedemptionRequested(buyer, message);
    }

    /// @notice Scrollkeeper approves redemption after review
    function approveRedemption(address buyer) external onlyScrollkeeper {
        require(redemptionRequested[buyer], "No redemption requested");
        redeemed[buyer] = true;
        emit RedemptionApproved(buyer);
    }

    /// @notice View redemption status
    function isRedeemed(address buyer) external view returns (bool) {
        return redeemed[buyer];
    }
}
