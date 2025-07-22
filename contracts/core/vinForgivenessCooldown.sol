// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinForgivenessCooldown
/// @notice After punishment, offender may restore reputation only after the cooldown period.
contract vinForgivenessCooldown {
    address public immutable scrollkeeper;
    uint256 public constant cooldown = 1 days;

    mapping(address => uint256) public lastSanction;
    mapping(address => bool) public redeemed;

    event SanctionLogged(address indexed offender, uint256 time);
    event RedemptionUnlocked(address indexed offender);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logSanction(address offender) external onlyScrollkeeper {
        lastSanction[offender] = block.timestamp;
        redeemed[offender] = false;
        emit SanctionLogged(offender, block.timestamp);
    }

    function tryRedeem(address offender) external {
        require(block.timestamp >= lastSanction[offender] + cooldown, "Cooldown not finished");
        require(!redeemed[offender], "Already redeemed");
        redeemed[offender] = true;
        emit RedemptionUnlocked(offender);
    }

    function isRedeemed(address offender) external view returns (bool) {
        return redeemed[offender];
    }
}
