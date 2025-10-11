// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FounderVestingSignalDAO {
    address public originator;

    struct VestingSignal {
        string founderName;
        uint256 vestingStart;
        uint256 vestingEnd;
        bool isMilestoneLinked;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    VestingSignal[] public vestingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logVestingSignal(
        string memory founderName,
        uint256 vestingStart,
        uint256 vestingEnd,
        bool isMilestoneLinked,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        vestingLedger.push(VestingSignal({
            founderName: founderName,
            vestingStart: vestingStart,
            vestingEnd: vestingEnd,
            isMilestoneLinked: isMilestoneLinked,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
