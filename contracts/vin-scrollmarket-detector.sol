// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract VinScrollMarketDetector {
    struct Snapshot {
        uint256 timestamp;
        uint256 balance;
    }

    IERC20 public token;
    address public vault;
    Snapshot[] public history;
    uint256 public dropThreshold; // e.g. 10% drop
    address public immutable detectorMaster;

    event LiquiditySnapshot(uint256 balance, uint256 timestamp);
    event FUDDetected(uint256 dropPercent, uint256 fromBalance, uint256 toBalance, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == detectorMaster, "Not the detector master");
        _;
    }

    constructor(address tokenAddress, address vaultAddress, uint256 thresholdPercent) {
        token = IERC20(tokenAddress);
        vault = vaultAddress;
        dropThreshold = thresholdPercent;
        detectorMaster = msg.sender;
    }

    function recordSnapshot() external onlyMaster {
        uint256 currentBalance = token.balanceOf(vault);
        history.push(Snapshot({
            timestamp: block.timestamp,
            balance: currentBalance
        }));

        emit LiquiditySnapshot(currentBalance, block.timestamp);

        if (history.length >= 2) {
            Snapshot memory prev = history[history.length - 2];
            uint256 drop = prev.balance > currentBalance
                ? ((prev.balance - currentBalance) * 100) / prev.balance
                : 0;

            if (drop >= dropThreshold) {
                emit FUDDetected(drop, prev.balance, currentBalance, block.timestamp);
            }
        }
    }

    function getSnapshot(uint256 index) external view returns (Snapshot memory) {
        require(index < history.length, "Invalid index");
        return history[index];
    }

    function totalSnapshots() external view returns (uint256) {
        return history.length;
    }
}
