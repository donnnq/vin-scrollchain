// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BlessingOracle - Dispenses poetic affirmations and financial aid upon soulbound upgrade
/// @author Vinvin
/// @notice Only callable by SoulboundUpgrade.sol to ensure ritual integrity

contract BlessingOracle {
    address public soulboundUpgrade;
    mapping(address => bool) public hasReceivedBlessing;

    event BlessingDispensed(address indexed recipient, string affirmation, uint256 amount);

    modifier onlySoulboundUpgrade() {
        require(msg.sender == soulboundUpgrade, "Unauthorized scroll");
        _;
    }

    constructor(address _soulboundUpgrade) {
        soulboundUpgrade = _soulboundUpgrade;
    }

    /// @notice Dispense blessing and aid to a citizen
    function dispenseBlessing(address recipient, string calldata affirmation) external payable onlySoulboundUpgrade {
        require(!hasReceivedBlessing[recipient], "Already blessed");

        hasReceivedBlessing[recipient] = true;
        payable(recipient).transfer(msg.value);

        emit BlessingDispensed(recipient, affirmation, msg.value);
    }

    /// @notice Receive funds to fuel blessings
    receive() external payable {}
}
