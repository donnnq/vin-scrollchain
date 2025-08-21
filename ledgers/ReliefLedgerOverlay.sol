// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract ReliefLedgerOverlay {
    struct UsageLog {
        string nation;
        string steward;
        string category; // e.g. "Healthcare", "Climate", "Education"
        uint256 amountUsed;
        string impactSummary;
        uint256 timestamp;
    }

    UsageLog[] public logs;

    event ReliefLogged(string nation, string category, uint256 amountUsed, string impactSummary, uint256 timestamp);

    function logUsage(
        string memory nation,
        string memory steward,
        string memory category,
        uint256 amountUsed,
        string memory impactSummary
    ) public {
        logs.push(UsageLog(nation, steward, category, amountUsed, impactSummary, block.timestamp));
        emit ReliefLogged(nation, category, amountUsed, impactSummary, block.timestamp);
    }

    function getLogs() public view returns (UsageLog[] memory) {
        return logs;
    }
}
