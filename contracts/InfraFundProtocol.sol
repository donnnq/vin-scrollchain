// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Infrastructure Fund Protocol v1.0
/// @notice Tracks public infrastructure allocations with emotional tagging and milestone logging

contract InfraFundProtocol {
    address public originator;

    struct InfraFund {
        string projectName;
        uint256 allocatedAmount;
        string milestoneTag; // e.g. "Phase 1", "Completion", "Delayed"
        string emotionalTag; // e.g. "Hope", "Suspicion", "Restoration"
        uint256 timestamp;
    }

    InfraFund[] public fundLog;

    constructor() {
        originator = msg.sender;
    }

    function logFund(
        string memory projectName,
        uint256 allocatedAmount,
        string memory milestoneTag,
        string memory emotionalTag
    ) external {
        fundLog.push(InfraFund({
            projectName: projectName,
            allocatedAmount: allocatedAmount,
            milestoneTag: milestoneTag,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));
    }

    function totalAllocated() external view returns (uint256 total) {
        for (uint256 i = 0; i < fundLog.length; i++) {
            total += fundLog[i].allocatedAmount;
        }
    }
}
