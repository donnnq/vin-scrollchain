// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title VINVIN’s Upgrade Pulse Module
/// @notice Suggests patches and upgrade signals from upstream libraries

contract UpgradePulse {
    address public keeper;
    mapping(address => bool) public flaggedModules;

    event UpgradeSuggested(address indexed module, string patchLog, bool isCritical);
    event CompatibilitySignal(address indexed module, string notes);

    modifier onlyKeeper() {
        require(msg.sender == keeper, "Not scrollkeeper");
        _;
    }

    constructor() {
        keeper = msg.sender;
    }

    function suggestUpgrade(address module, string memory patchLog, bool isCritical) external onlyKeeper {
        flaggedModules[module] = true;
        emit UpgradeSuggested(module, patchLog, isCritical);
    }

    function signalCompatibility(address module, string memory notes) external onlyKeeper {
        emit CompatibilitySignal(module, notes);
    }
}
