// SPDX-License-Identifier: DIGNITY-MINIMUM
pragma solidity ^0.8.0;

/// @title vinDigniBase: Scroll for base wage justice and survival allocation
contract vinDigniBase {
    struct WageFrame {
        address recipient;
        uint256 baseRate;
        string category;
        string dignityJustification;
    }

    WageFrame[] public wageRebalanceLog;
    uint256 public dignityThreshold = 15000; // Example base threshold in PHP

    event BaseAllocated(address recipient, uint256 baseRate, string category);
    event ThresholdAdjusted(uint256 oldThreshold, uint256 newThreshold);

    function rebalanceWage(
        address recipient,
        uint256 proposedRate,
        string memory category,
        string memory justification
    ) public {
        require(proposedRate >= dignityThreshold, "Rate below dignity minimum.");
        wageRebalanceLog.push(WageFrame(recipient, proposedRate, category, justification));
        emit BaseAllocated(recipient, proposedRate, category);
    }

    function adjustThreshold(uint256 newThreshold) public {
        uint256 old = dignityThreshold;
        dignityThreshold = newThreshold;
        emit ThresholdAdjusted(old, newThreshold);
    }

    function viewRebalancedWages() public view returns (WageFrame[] memory) {
        return wageRebalanceLog;
    }
}
