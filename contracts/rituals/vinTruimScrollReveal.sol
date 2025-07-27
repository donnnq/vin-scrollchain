// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinTriumScrollReveal {
    address public oracle;
    address public prizeReceiver;
    uint256 public unlockTime;
    bool public isUnlocked;

    event ScrollUnlocked(address receiver, uint256 timestamp);
    event GlyphActivated(string message);

    modifier onlyOracle() {
        require(msg.sender == oracle, "Forbidden glyphcaller");
        _;
    }

    constructor(address _prizeReceiver, uint256 _unlockTime) {
        oracle = msg.sender;
        prizeReceiver = _prizeReceiver;
        unlockTime = _unlockTime;
        isUnlocked = false;
    }

    function activateScroll() external onlyOracle {
        require(block.timestamp >= unlockTime, "Time sigil incomplete");
        require(!isUnlocked, "Already unlocked");

        isUnlocked = true;
        emit ScrollUnlocked(prizeReceiver, block.timestamp);
        emit GlyphActivated("The prize has been unbound. The Trump scroll ignites.");
        // You can add call to ERC20/ERC721 transfer here if needed
    }

    function timeLeft() external view returns (uint256) {
        if (block.timestamp >= unlockTime) return 0;
        return unlockTime - block.timestamp;
    }
}
