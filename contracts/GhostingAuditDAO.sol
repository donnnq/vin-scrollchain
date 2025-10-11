// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GhostingAuditDAO {
    address public originator;

    struct GhostingSignal {
        string candidateName;
        bool interviewCompleted;
        bool feedbackPromised;
        bool ghosted;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    GhostingSignal[] public ghostingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logGhostingSignal(
        string memory candidateName,
        bool interviewCompleted,
        bool feedbackPromised,
        bool ghosted,
        bool isScrollchainSealed
    ) external {
        ghostingLedger.push(GhostingSignal({
            candidateName: candidateName,
            interviewCompleted: interviewCompleted,
            feedbackPromised: feedbackPromised,
            ghosted: ghosted,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
