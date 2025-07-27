// SPDX-License-Identifier: Aura-Burst-Scrolls-2025
pragma solidity ^0.8.21;

contract vinFlexRevealEmitter {
    address public flexOracle;
    uint256 public latestFlexLevel;

    event FlexRevealed(uint256 indexed newLevel, string scrollMessage, string subsystem);

    modifier onlyOracle() {
        require(msg.sender == flexOracle, "No scroll credentials");
        _;
    }

    constructor() {
        flexOracle = msg.sender;
    }

    function revealFlex(uint256 newLevel, string calldata message, string calldata subsystem) external onlyOracle {
        latestFlexLevel = newLevel;
        emit FlexRevealed(newLevel, message, subsystem);
    }

    function viewFlexLevel() external view returns (uint256) {
        return latestFlexLevel;
    }
}
