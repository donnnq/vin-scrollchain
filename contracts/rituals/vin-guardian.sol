// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title VINVIN’s DeFi Guardian Contract
/// @notice Monitors DeFi protocols for suspicious behavior and auto-freezes risky assets.

contract Guardian {
    address public keeper;
    mapping(address => bool) public watchlist;
    bool public emergencyFreeze;
    
    event ThreatDetected(address indexed suspect, uint256 valueMoved, string vector, bool freezeActivated);
    event AssetUnlocked(address indexed account);

    modifier onlyKeeper() {
        require(msg.sender == keeper, "Not scrollkeeper");
        _;
    }

    constructor() {
        keeper = msg.sender;
        emergencyFreeze = false;
    }

    function detectThreat(address suspect, uint256 valueMoved, string memory vector) external onlyKeeper {
        if (valueMoved > 1_000_000 ether) {
            emergencyFreeze = true;
        }
        watchlist[suspect] = true;
        emit ThreatDetected(suspect, valueMoved, vector, emergencyFreeze);
    }

    function unlockAssets(address account) external onlyKeeper {
        watchlist[account] = false;
        emergencyFreeze = false;
        emit AssetUnlocked(account);
    }
}
