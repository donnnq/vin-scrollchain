// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FounderTrajectorySignalDAO {
    address public originator;

    struct TrajectorySignal {
        string founderName;
        uint256 milestoneFDV;
        bool isUnlockEligible;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TrajectorySignal[] public founderLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTrajectorySignal(
        string memory founderName,
        uint256 milestoneFDV,
        bool isUnlockEligible,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        founderLedger.push(TrajectorySignal({
            founderName: founderName,
            milestoneFDV: milestoneFDV,
            isUnlockEligible: isUnlockEligible,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
