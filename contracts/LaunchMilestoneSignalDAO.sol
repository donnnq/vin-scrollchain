// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LaunchMilestoneSignalDAO {
    address public originator;

    struct MilestoneSignal {
        string projectName;
        uint256 currentFDV;
        bool isUnlockTriggered;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    MilestoneSignal[] public milestoneLedger;

    constructor() {
        originator = msg.sender;
    }

    function logMilestoneSignal(
        string memory projectName,
        uint256 currentFDV,
        bool isUnlockTriggered,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        milestoneLedger.push(MilestoneSignal({
            projectName: projectName,
            currentFDV: currentFDV,
            isUnlockTriggered: isUnlockTriggered,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
