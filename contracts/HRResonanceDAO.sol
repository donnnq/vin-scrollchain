// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HRResonanceDAO {
    address public originator;

    struct ResonanceSignal {
        string candidateName;
        bool interviewCompleted;
        bool silenceDetected;
        bool dignityRestored;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ResonanceSignal[] public resonanceLedger;

    constructor() {
        originator = msg.sender;
    }

    function logResonanceSignal(
        string memory candidateName,
        bool interviewCompleted,
        bool silenceDetected,
        bool dignityRestored,
        bool isScrollchainSealed
    ) external {
        resonanceLedger.push(ResonanceSignal({
            candidateName: candidateName,
            interviewCompleted: interviewCompleted,
            silenceDetected: silenceDetected,
            dignityRestored: dignityRestored,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
