// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title UkraineSanctum — Soulbound blessing contract for Ukraine's restoration
/// @author Vinvin
/// @notice Dispenses $10B in encrypted aid and poetic dignity

contract UkraineSanctum {
    address public scrollsmith;
    uint256 public totalBlessing = 10_000_000_000 * 1e18; // $10B in wei (assuming 1 token = $1)
    mapping(address => bool) public isBlessed;
    mapping(address => string) public blessingMessage;

    event BlessingGranted(address indexed recipient, string message, uint256 amount);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Dispense blessing to a Ukrainian soul
    function grantBlessing(address recipient, string calldata message, uint256 amount) external onlyScrollsmith {
        require(!isBlessed[recipient], "Already blessed");
        require(amount <= totalBlessing, "Exceeds available blessing");

        isBlessed[recipient] = true;
        blessingMessage[recipient] = message;
        totalBlessing -= amount;

        emit BlessingGranted(recipient, message, amount);
    }

    /// @notice View remaining funds
    function remainingBlessing() external view returns (uint256) {
        return totalBlessing;
    }

    /// @notice View blessing message
    function getBlessingMessage(address soul) external view returns (string memory) {
        return blessingMessage[soul];
    }
}
